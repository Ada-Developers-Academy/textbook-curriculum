# Secure Sockets Layer (SSL)
Secure Sockets Layer, or SSL, is a networking technology that allows two individuals (more precisely: two computers) to communicate across an _insecure channel_, such as the Internet, in a secure way. To achieve this, the system uses _end-to-end encryption_ as well as _public/private key pairs_ and _certificates_ to identify one or both participants.

## Concepts
### Public/Private Key Pairs
These are the same kind of key pair we generated and use when communicating with GitHub, or when using SSH to connect to our Amazon EC2 instances.

### Certificates
A certificate is a file that includes:
* A public key
* Some metadata about the owner of that public key (and its associated private key). For example:
  * Domain Name (if the owner is a website)
  * Individual or Organization Name
  * Email Address
  * Location on Earth
* Signatures from one or more _certificate authorities_.

### Certificate Authorities (CAs)
A certificate authority is an organization whose purpose or business is to provide or sell certificates to end-users. Certificate authorities must comply with very strict regulatory guidelines, and they are audited by major accounting firms on a regular basis.

Most of the regulatory requirements for CAs are designed to ensure that the private key(s) that the organization owns (and uses to sign the certificates they produce) are stored as securely as possible, and that there are proper controls to avoid employee mis-use or theft.

While anyone can technically create a certificate authority on their computer using the OpenSSL software, only "recognized" (trusted) CAs will be accepted by your web browser. Major software organizations such as Mozilla, Google, Apple, and Microsoft maintain lists of all CAs that they trust, and only certificates obtained from one of those authorities will be considered valid by the average user's browser or phone. Currently there are about two hundred CAs that are on most/all of those lists.

Because the number of trusted CAs is limited, traditionally there has been a bit of a monopoly in that market. Most commercial CAs will charge anywhere from $10 to $100 for a certificate that expires after a year, but there are also a variety of free options.

## Obtaining an SSL Certificate
There are two free options for getting an SSL cert. First, if you're using the AWS ecosystem (Elastic Beanstalk, Route 53, etc.), you can get a cert through Amazon. Second, if your hosting is through another provider (Heroku, for example), you can use Let's Encrypt to get a cert.

## Via Amazon
This is far and away the easiest method for obtaining a cert if you're working in the Amazon environment.

### Initial Setup
1. Get your project deployed to Elastic Beanstalk
1. Attach a domain to your project via Route 53

### Request the Cert
1. Go to console.aws.amazon.com
1. Open `Services` menu in upper left
1. Under `Security, Identity & Compliance` click `Certificate Manager`
1. Click `Request a Certificate`
1. Type your URL, and click `Review and Request`
1. Click `Confirm and Request`
1. In a couple minutes, you'll get an email at the address you associated with that domain via Route 53. Click the link and Amazon will issue the cert.

### Attaching the Cert to Elastic Beanstalk
1. Go to console.aws.amazon.com
1. Open `Services` menu in upper left
1. Under `Compute` click `Elastic Beanstalk`
1. Click your environment
1. On the left bar, click `Configuration`
1. Scroll down, and under `Network Tier` click the gear icon on the `Load Balancing` box
1. Make sure `Secure listener port` is set to `443`, and `Protocol` to `HTTPS`
1. For `SSL certificate ID`, select the DNS record you just made a cert for
1. Scroll down and click `Apply`
1. Wait for the environment to refresh
1. Prefix your webapp's URL with `https://`, and when the page loads you should see a little green lock in the address bar. This means it's working!

## Via Let's Encrypt
Very recently (in the final months of 2015) the first completely free certificate authority has opened for public use: [Lets Encrypt](https://letsencrypt.org/)! This service is designed to provide only the most minimal identity validation that SSL allows, called "Domain Control Validation", meaning they make no attempt to verify that you as an individual or your organization is real. This is sufficient for almost all purposes however, and by avoiding that stuff they can actually run a fully automated system and provide unlimited certificates free of charge.

### Setup a Route for Lets Encrypt
Let's Encrypt has to verify you control a domain before they'll give you a certification for it. To do so, they give you a secret key, and ask you to serve it from a well-known route on your server. Setting up that route is our first step.

1. Add this route to your Rails project:

  ```ruby
    get "/.well-known/acme-challenge/#{ENV['LE_AUTH_REQUEST']}", to: 'welcome#letsencrypt'
  ```
1. And add this action into the WelcomeController (or whichever controller your route goes to):

  ```ruby
    def letsencrypt
      render plain: ENV['LE_AUTH_RESPONSE']
    end
  ```
1. Then `git add` and `git commit` those changes.
1. Push your code to Heroku with `git push heroku`, or to AWS with `eb deploy`.

### Certificate Signing Requests (CSRs)
A certificate signing request is a file that you generate on your computer with all of the _metadata_ details for your certificate. Once you've generated this file, you send it to your CA along with your *public* key, and once you've been verified the CA sends you a signed certificate that you can use with your web server.

#### Generate a Certificate Signing Request
```bash
$ cd <your project directory>
$ mkdir ssl
$ cd ssl
$ DOMAIN_NAME=<your domain name here>
$ EMAIL_ADDRESS=<your email address here>
$ brew update
$ brew install letsencrypt
$ echo "[ SAN ]" >> /usr/local/etc/openssl/openssl.cnf
$ echo "subjectAltName=DNS:$DOMAIN_NAME" >> /usr/local/etc/openssl/openssl.cnf
$ openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout privkey.pem -out signreq.der -outform der -subj "/C=US/ST=Washington/L=Seattle/O=$DOMAIN_NAME/emailAddress=$EMAIL_ADDRESS/CN=$DOMAIN_NAME"
```

#### Send the CSR to Lets Encrypt
```bash
$ sudo letsencrypt certonly --authenticator manual --text --email <your email> --csr signreq.der
```

This will prompt you with the URL that Lets Encrypt will attempt to visit in order to verify you control the domain used in the certificate.
Find the _request_ string and the _response_ string, and put them into the appropriate environment variables:
```bash
heroku config:set LE_AUTH_REQUEST=fh3f820jf2f0h23f8
heroku config:set LE_AUTH_RESPONSE=fh3f820jf2f0h23f8.fh29f8230f23fhg23802fg23pf3f9m
```
OR
```bash
eb setenv LE_AUTH_REQUEST=fh3f820jf2f0h23f8
eb setenv LE_AUTH_RESPONSE=fh3f820jf2f0h23f8.fh29f8230f23fhg23802fg23pf3f9m
```

Finally, press Enter at the Lets Encrypt prompt to complete the Certificate Signing Request process. This should create several new files, all with the `.pem` extension - these are your certs.

### Installing the Certificate

#### On Heroku
Unfortunately, Heroku does not support SSL on its free tier. If you are using a paid tier, you can follow the [instructions in the Heroku documentation](https://devcenter.heroku.com/articles/ssl). For the two files they ask you to provide, `server.crt` will be `0000_cert.pem`, and `server.key` will be `privkey.pem`.

#### On AWS
If you don't already have the AWS CLI set up already, you'll need an access key pair. This can be accomplished through AWS's Identity and Access Management (IAM) interface.

1. Go to console.aws.amazon.com
1. Open `Services` menu in upper left
1. Under `Security, Identity and Compliance` click `IAM`
1. On the left sidebar, click `Users`
1. Click the blue `Add user` button
1. Create a new user:
  1. For `User name` type `Admin`
  1. Under `Select AWS access type`, select `Programmatic access`
  1. Click the blue `Next: Permissions` button
1. Add the `IAMFullAccess` policy, and click the blue `Next: Review` button
1. Click the blue `Create User` button
1. Stay on this page! For security, AWS will only show you the keys once, so you'll need to copy-paste them in below before navigating away.

Then set up the AWS CLI:
```bash
$ brew install awscli
$ aws configure
```

It will ask you for the access key ID and token you just generated. You can leave the other fields blank.

Next, we'll use the AWS CLI to deploy our new cert.

```bash
$ cd <your project directory>/ssl
$ aws iam upload-server-certificate --server-certificate-name elastic-beanstalk-x509 --certificate-chain file://0000_chain.pem --certificate-body file://0000_cert.pem --private-key file://privkey.pem
```

#### Configuring AWS to Use the Installed Cert
1. Go to console.aws.amazon.com
1. Open `Services` menu in upper left
1. Under `Compute` click `Elastic Beanstalk`
1. Click your environment
1. On the left bar, click `Configuration`
1. Scroll down, and under `Network Tier` click the gear icon on the `Load Balancing` box
1. Make sure `Secure listener port` is set to `443`, and `Protocol` to `HTTPS`
1. For `SSL certificate ID`, select the DNS record you just made a cert for (`elastic-beanstalk-x509`)
1. Scroll down and click `Apply`
1. Wait for the environment to refresh
1. Prefix your webapp's URL with `https://`, and when the page loads you should see a little green lock in the address bar. This means it's working!
