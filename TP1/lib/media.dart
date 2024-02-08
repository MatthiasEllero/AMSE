class Media {
  String name;
  String genre;
  String year;
  String image_url;

  Media(this.name, this.genre, this.year, this.image_url);
}

var listeMedia = [
  Media("Inception", "film", "2010",
      "https://fr.web.img2.acsta.net/medias/nmedia/18/72/34/14/19476654.jpg"),
  Media("Parasite", "film", "2019",
      "https://fr.web.img6.acsta.net/pictures/20/02/12/13/58/3992754.jpg"),
  Media("Interstellar", "film", "2014",
      "https://fr.web.img6.acsta.net/pictures/14/09/24/12/08/158828.jpg"),
  Media("The Matrix", "film", "1999",
      "https://fr.web.img4.acsta.net/c_310_420/medias/04/34/49/043449_af.jpg"),
  Media("Avengers: Endgame", "film", "2019",
      "https://fr.web.img2.acsta.net/pictures/19/04/04/09/04/0472053.jpg"),
  Media("Forrest Gump", "film", "1994",
      "https://fr.web.img4.acsta.net/pictures/15/10/13/15/12/514297.jpg"),
  Media("The Shawshank Redemption", "film", "1994",
      "https://m.media-amazon.com/images/I/61-vQDr7ecL._AC_UF1000,1000_QL80_.jpg"),
  Media("Pulp Fiction", "film", "1994",
      "https://fr.web.img4.acsta.net/medias/nmedia/18/36/02/52/18846059.jpg"),
  Media("The Dark Knight", "film", "2008",
      "https://fr.web.img2.acsta.net/medias/nmedia/18/63/97/89/18949761.jpg"),
  Media("Fight Club", "film", "1999",
      "https://m.media-amazon.com/images/I/71IWKA9Rn4L._AC_UF1000,1000_QL80_.jpg"),
  Media("The Godfather", "film", "1972",
      "https://fr.web.img6.acsta.net/c_310_420/pictures/22/01/14/08/39/1848157.jpg"),
  Media("Jurassic Park", "film", "1993",
      "https://fr.web.img4.acsta.net/pictures/20/07/21/16/53/1319265.jpg"),
  Media("Star Wars: Episode IV - A New Hope", "film", "1977",
      "https://fr.web.img6.acsta.net/medias/nmedia/18/35/41/59/18422600.jpg"),
  Media("The Lord of the Rings: The Fellowship of the Ring", "film", "2001",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQF0CvfZuJWMnVAUlI7ktjlq6FpOmIjfUwjf9vfNH04Kw&s"),
  Media("Titanic", "film", "1997",
      "https://m.media-amazon.com/images/I/811lT7khIrL._AC_UF1000,1000_QL80_.jpg"),
  Media("Back to the Future", "film", "1985",
      "https://m.media-amazon.com/images/I/71JjDoElLbL._UF1000,1000_QL80_.jpg"),
  Media("Gladiator", "film", "2000",
      "https://fr.web.img6.acsta.net/medias/nmedia/18/68/64/41/19254510.jpg"),
  Media("Saving Private Ryan", "film", "1998",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUIpazTvzSJDbxIsIYdVGD5Bi28PYtrRhU7oNIHGJ7nw&s"),
  Media("Mad Max: Fury Road", "film", "2015",
      "https://fr.web.img3.acsta.net/pictures/15/04/14/18/30/215297.jpg"),
  Media("The Grand Budapest Hotel", "film", "2014",
      "https://fr.web.img3.acsta.net/pictures/14/01/20/12/06/239820.jpg"),
  Media("One Piece", "manga", "1997",
      "https://fr.web.img3.acsta.net/c_310_420/pictures/19/08/09/14/53/1842996.jpg"),
  Media("Attack on Titan (Shingeki no Kyojin)", "manga", "2009",
      "https://fr.web.img4.acsta.net/pictures/18/10/31/18/23/3895256.jpg"),
  Media("Naruto", "manga", "1999",
      "https://fr.web.img2.acsta.net/pictures/19/08/02/15/12/4423178.jpg"),
  Media("Death Note", "manga", "2003",
      "https://fr.web.img5.acsta.net/pictures/18/01/18/14/35/2024405.jpg"),
  Media("My Hero Academia (Boku no Hero Academia)", "manga", "2014",
      "https://fr.web.img3.acsta.net/c_310_420/pictures/21/02/16/12/45/5319199.jpg"),
  Media("Berserk", "manga", "1989",
      "https://m.media-amazon.com/images/I/71lnvXSiITL._AC_UF1000,1000_QL80_.jpg"),
  Media("Fullmetal Alchemist", "manga", "2001",
      "https://fr.web.img4.acsta.net/pictures/19/07/30/12/08/0075575.jpg"),
  Media("Dragon Ball", "manga", "1984",
      "https://fr.web.img2.acsta.net/pictures/22/11/22/14/02/3642167.jpg"),
  Media("One Punch Man", "manga", "2009",
      "https://fr.web.img4.acsta.net/c_310_420/pictures/17/02/27/17/41/046707.jpg"),
  Media("Hunter x Hunter", "manga", "1998",
      "https://fr.web.img5.acsta.net/pictures/19/08/01/09/52/4803203.jpg"),
  Media("Tokyo Ghoul", "manga", "2011",
      "https://fr.web.img5.acsta.net/pictures/15/11/04/15/59/314681.jpg"),
  Media("Bleach", "manga", "2001",
      "https://fr.web.img6.acsta.net/pictures/19/07/19/14/52/5225691.jpg"),
  Media("JoJo's Bizarre Adventure", "manga", "1987",
      "https://fr.web.img3.acsta.net/c_310_420/pictures/20/03/10/12/07/4001550.jpg"),
  Media("Demon Slayer: Kimetsu no Yaiba", "manga", "2016",
      "https://fr.web.img6.acsta.net/pictures/19/09/18/13/46/0198270.jpg"),
  Media("Vinland Saga", "manga", "2005",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuHnNHOdaWJ8bZHhYkiJcSfWoGTzYAGV2aQj-kGYpOhA&s"),
  Media("Gintama", "manga", "2003",
      "https://fr.web.img2.acsta.net/pictures/19/09/11/13/43/4503509.jpg"),
  Media("Haikyuu!!", "manga", "2012",
      "https://www.crunchyroll.com/imgsrv/display/thumbnail/480x720/catalog/crunchyroll/af5f2304138a2ebe9caf5b7d0b1e2f01.jpe"),
  Media("The Promised Neverland", "manga", "2016",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbV2xqJfPC1K1Kf7vkPy0olARMCe-0K_gd9eTEZ69AHQ&s"),
  Media("Black Clover", "manga", "2015",
      "https://www.nautiljon.com/images/anime/00/74/black_clover_tv_6447.webp"),
  Media("Fairy Tail", "manga", "2006",
      "https://www.nautiljon.com/images/anime/00/34/fairy_tail_1343.webp"),
  Media("Breaking Bad", "série", "2008",
      "https://fr.web.img5.acsta.net/pictures/19/06/18/12/11/3956503.jpg"),
  Media("Game of Thrones", "série", "2011",
      "https://fr.web.img3.acsta.net/c_310_420/pictures/23/01/03/14/13/0717778.jpg"),
  Media("The Crown", "série", "2016",
      "https://fr.web.img4.acsta.net/pictures/17/11/07/09/45/4038936.png"),
  Media("Stranger Things", "série", "2016",
      "https://fr.web.img5.acsta.net/pictures/17/08/31/23/41/560893.jpg"),
  Media("The Witcher", "série", "2019",
      "https://fr.web.img6.acsta.net/pictures/19/12/12/12/13/2421997.jpg"),
  Media("The Office (US)", "série", "2005",
      "https://fr.web.img3.acsta.net/pictures/20/08/16/19/44/1418178.jpg"),
  Media("Friends", "série", "1994",
      "https://fr.web.img2.acsta.net/pictures/18/11/13/14/05/2764761.jpg"),
  Media("The Sopranos", "série", "1999",
      "https://fr.web.img6.acsta.net/pictures/23/01/03/14/33/4278301.jpg"),
  Media("Sherlock", "série", "2010",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1H1eeIrodIK2X4oTFvDRQrqpmHkew_MI6vwKWcD5P6w&s"),
  Media("The Big Bang Theory", "série", "2007",
      "https://fr.web.img5.acsta.net/pictures/18/11/06/15/36/0408812.jpg"),
  Media("Westworld", "série", "2016",
      "https://m.media-amazon.com/images/I/81V2yYyPA2L._AC_UF1000,1000_QL80_.jpg"),
  Media("Black Mirror", "série", "2011",
      "https://fr.web.img6.acsta.net/pictures/23/05/24/11/22/4785740.jpg"),
  Media("Dexter", "série", "2006",
      "https://m.media-amazon.com/images/I/81JKXT1j0OL._AC_UF1000,1000_QL80_.jpg"),
  Media("The Mandalorian", "série", "2019",
      "https://fr.web.img5.acsta.net/pictures/23/02/02/08/50/0382923.jpg"),
  Media("The Handmaid's Tale", "série", "2017",
      "https://m.media-amazon.com/images/I/71pKGT6Z5DL._AC_UF1000,1000_QL80_.jpg"),
  Media("Better Call Saul", "série", "2015",
      "https://static.wikia.nocookie.net/scripts/images/2/22/Better_Call_Saul.jpg/revision/latest?cb=20200408050249&path-prefix=fr"),
  Media("The Walking Dead", "série", "2010",
      "https://fr.web.img6.acsta.net/pictures/22/08/29/18/20/3648785.jpg"),
  Media("Chernobyl", "série", "2019",
      "https://fr.web.img2.acsta.net/c_310_420/pictures/23/01/03/14/05/3165194.jpgt"),
  Media("Peaky Blinders", "série", "2013",
      "https://fr.web.img6.acsta.net/c_310_420/pictures/22/06/07/11/57/5231272.jpg"),
  Media("Fargo", "série", "2014",
      "https://m.media-amazon.com/images/I/710WL7y9KBL._AC_UF1000,1000_QL80_.jpg"),
];