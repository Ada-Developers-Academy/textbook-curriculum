const captainMarvel = {
  givenName: 'Carol Danvers',
  nickname: 'Vers',
  age: 41,
  sideburns: false,
  affiliations: ["The Avengers", "S.H.I.E.L.D.", "The Starjammers"],
  fly() {
    console.log('zoom!');
    console.log('swish!');
    console.log('fweeee!');
  },
  getResume() {
    for(let i = 0; i < this.affiliations.length; i += 1){
      console.log(`I'm a member of ${this.affiliations[i]}`);
    }
    console.log('I have a long and storied history, okay?')
  }
}

captainMarvel.getResume()

