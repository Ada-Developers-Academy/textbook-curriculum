# Interview Questions - Data Structures

How is this data going to be accessed? Do we need to optimize for latency or space?

+ Parking Lot for monthly parking
  - Design a system where customers are assigned a specific spot
  - Write isFullyBooked()
  - Write assignSpot(name)
  - What if the spots have different types (like handicap, motorcycle, electric car)?
+ URL Autocomplete
  - Design a system that stores browser history of URLs
  - Write autocomplete(prefix) which returns all the URLs that could autocomplete with the given prefix
+ Gmail Suggested Email
  - When you write an email to a group of people, related people are suggested. How would you implement this feature?
+ Web Crawler
  - Design a system for a WebCrawler. The webcralwler will be provided millions of URLs. Each webpage needs to be downloaded and then parsed for more URLs. If more URLs are found then they should also be downloaded and parsed.
  - Does your solution scale to handle millions of URLs?
  - What are the bottle necks in the system? How will you resolve them?
+ Vending Machine
  - Design a system for a vending machine.
+ Nightclub Bouncer
  - Design a system for admitting people into a nightclub
  - Consider VIPs and parties larger than 1
  - Only 500 people may be inside at a time (per fire code, of course)
+ Website User Preferences
  - Design a system to store customer preferences (like default language, favorite color, shoe size) where every attribute will have a default value if not set by the user
  - Write getAttribute(name)
  - Write getAllAtrributes()
  - What if we want to change the default value of attributes that are not set by customers?

