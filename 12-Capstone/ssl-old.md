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

Because the number of trusted CAs is limited, traditionally there has been a bit of a monopoly in that market. Most commercial CAs will charge anywhere from $10 to $100 for a certificate that expires after a year. However, after a series of security breaches at major and minor certificate authorities in the past few years... people have started to question whether that cost is truly worth it.

Very recently (in the final months of 2015) the first completely free certificate authority has opened for public use: [Lets Encrypt](https://letsencrypt.org/)! This service is designed to provide only the most minimal identity validation that SSL allows, called "Domain Control Validation", meaning they make no attempt to verify that you as an individual or your organization is real. This is sufficient for almost all purposes however, and by avoiding that stuff they can actually run a fully automated system and provide unlimited certificates free of charge.

### Certificate Signing Requests (CSRs)
A certificate signing request is a file that you generate on your computer with all of the _metadata_ details for your certificate. Once you've generated this file, you send it to your CA along with your *public* key, and in return the CA sends you a signed certificate that you can use with your web server.

## Obtaining A Certificate
### Setup a route for Lets Encrypt
Add this route to your Rails project:
```ruby
  get "/.well-known/acme-challenge/#{ENV['LE_AUTH_REQUEST']}", to: 'welcome#letsencrypt'
```

And add this action into the WelcomeController (or whichever controller your route goes to):
```ruby
  def letsencrypt
    render plain: ENV['LE_AUTH_RESPONSE']
  end
```

1. Then `git add` and `git commit` those changes.
1. Push your code to Heroku with `git push heroku`, or to AWS with `eb deploy`. 

### Generate a Certificate Signing Request:
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
$ /usr/local/Cellar/openssl/1.0.2g/bin/openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout privkey.pem -out signreq.der -outform der -subj "/C=US/ST=Washington/L=Seattle/O=$DOMAIN_NAME/emailAddress=$EMAIL_ADDRESS/CN=$DOMAIN_NAME" -reqexts SAN
```

### Send the CSR to Lets Encrypt and get back a signed certificate:
```bash
$ sudo letsencrypt certonly --authenticator manual --text --email hamled@gmail.com --csr signreq.der
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

Finally, press Enter at the Lets Encrypt prompt to complete the Certificate Signing Request process.

## Installing A Certificate on AWS
```bash
$ brew install awscli
$ aws configure
$ aws iam upload-server-certificate --server-certificate-name elastic-beanstalk-x509 --certificate-chain file://0000_chain.pem --certificate-body file://0000_cert.pem --private-key file://privkey.pem
```

## Updating AWS with SSL settings
On AWS navigate to your environment > Configuration > Network Tier (at the bottom) > Load Balancing
Click the settings/gear next to Load Balancing
For the drop down that says “secure listener port” select `443`
For the drop down that says “certificate id” select `elastic-beanstalk-x509`
Click apply, then wait for AWS to update
