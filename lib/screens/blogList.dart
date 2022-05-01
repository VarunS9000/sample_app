import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infigon_app/services/search.dart';

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  List<String> images = ['kerala.jpg', 'jammu.jpg','switzerland.jpg','netherlands.jpg','canada.jpg','dubai.jpg','lasvegas.jpg','london.jpg','rome.jpg','egypt.jpg','philadelphia.jpg','hawai.jpg']; //list of images
  List<String> content = [
    'Besides that if you are a vegetarian you are in big problem as you will find next to no restaurant that would provide you good quality veg meal. In Munnar you can eat in Sravana Bhawan and in Kochi Sardarji ka Dhaba is good and in Thekkady Coffee routes provides good food however you will need to wait for . minutes for food to be prepared',
    "We had booked a 11 person trip for kashmir from Kashmir Experience. We had 6 senior citizen. The trip was well organized and without any problems. Mr. Rouff, Mr Zameer were very cooperative and took very good care of our senior citizen members. They treated and cared for them as there Parents. The tempo traveller driver Mr Owais was also very caring and took very good care and helped our parents. Kashmir was really a very memorable experience because of them. Heartily thanks to the team of kashmir experience. Their hospitality was awesome I would highly recommend Kashmir Experience company. We will always remember this trip as we had throughly enjoyed this trip.",
    "Switzerland has been the world’s most favourite holiday destination for decades now and the reason can be seen as soon as you get off the plane! Switzerland is home to simple breathtaking scenery with the  landscape being dotted with towering peaks, shimmering lakes and countless waterfalls.Switzerland has entertained tourists for a very long time and this means that here, you will be able to get tailored experiences like nowhere else.  You can be a part of fascinating train journeys through pristine landscapes, walk on suspension bridges that seem to float between two mountains offering panoramic views, walk behind waterfalls and through frozen glaciers.",
    "Visited Amsterdam a couple years ago. Amsterdam is absolutely gorgeous, the canals, row houses and cobbled streets. So many cafes lining the streets with great coffee and those little waffle like things were delicious. The Dutch are really friendly. Our taxi driver took us on a tour of the surrounding towns to see the windmills and countryside. The rijks museum had wonderful collections of art. Everything in central Amsterdam is in walking distance- you could walk from one end to the other in 20 mins. Also loved the insane amount of bikes! Amsterdam is easily one of my favourite cities in the world. I want to go back to visit in the spring to see the tulips gardens",
    "My experience of traveling to Canada (from London) by plane was the longest day ever! Following the sun all the way… created my worst jet-lag ever… and I had a job interview the next morning. Living and traveling IN Canada was awesome though. Vancouver was the number one place in the world to live at the time. The beaches, the mountains. I learned to ski at Whistler. Walked there in summer. Partied there numerous times. Vancouver island for New Year. Ice skating. The Grouse Grind! The ferry to Bowen Island – Great fish ‘n’ chips! Miss the beer. Took a Rockies road trip with three women. Camping at Lake O’Hara on the first day of spring. -13°C. The coldest I've ever been in a tent. Kayaking on Lake Louise. Couldn't feel my fingers! Buzzed by a humming bird. Stalked by a wolverine. Contact with Black bears, beavers and flying squirrels. Soaking in hot springs at Banff. Attempted to sleep in a hostel above a drum n bass club in Nelson. Wouldn't change a thing… ay!"
    "Dubai is a destination that has so much to explore. For a person coming from India , the night life in dubai is one of the best experience you get from. The long roads with cold breeze in the face . No words can explain that feels . Its a city that never sleeps. Apart from that how can someone come to Dubai and doesn't do a desserts safari , that feeling you have when you flow through the waves of sand is a memorising one. Shopping is also one of the best experience you get from dubai . We will get relatively cheap products from Dubai if you look for products at the right place . There will be variety of offers in all the malls and for us it is practically impossible to go to every mall to know the offers. So my friend suggested me to use Flyerbin , this platform summons all the flyers in the area into a digital platform and we could get avail the offers in the supermarkets and retail stores which are enlisted in Flyerbin."
    "The city totally abide’s by it’s name - The SIN City!! :D It is going to be one hell of a ride at Vegas and you can feel the excitement right from that flight, where you are about to land. You look through your window, you can’t stop gazing at this beautiful city. Ultimately, you can expect the time of your life in this city, good looking people everywhere, almost nude girls on the streets, people are either in shorts and slipper or in bodycon and stilettos, night clubs in every corner and lot of drinking and walking!",
    "My first time visiting London was in August 2013 and it was a divine experience for me. So much so that I've gone back every year (except this year) due to COVID-19. London is my heart! The history. The people. The food. The countryside. All of it! As a visitor, you can really lose yourself while there. When I visit, I always stay in Bayswater (which is also favorite of mine as well) because I can just walk directly across the street to Hyde Park and take in the be beauty. I encourage everyone to step outside their comfort zone and visit at least once!",
    "I love going for a walk starting from Piramide passing through Colosseo, Fontana di Trevi, Piazza del popolo, and finally reaching Basilica di San Pietro. Check for temporary exhibits and watch the Vatican Museum. At the night look for Campo di Fiori, Ponte Milvio, or Testaccio to drink and dance.",
    "The media still portray Egypt as the land of ancient archaeology and exciting discoveries, when in fact these days are now long gone as the country is the most popular tourist destination in North Africa. The main sight of the country is also its biggest letdown. When you think of the Giza Pyramids, you imagine these tall, ancient, alien-looking structures in the middle of nowhere that you can only reach after a long march in the desert. Truth is, the Pyramids are actually in front of the city and the best view you can get of them is from the nearby KFC. If you want to see them from up close, be ready for herds of sweaty tourists and insisting locals trying to sell you anything that can have a price.",
    "I love the walkability of the city, the outstanding food and bar scene that remains accessible and unpretentious, and the sheer amount of art and culture available to anyone - the city seems to breathe art, from the extensive murals that adorn formerly blank walls to the sculptures that pop up everywhere, to the excellent and sometimes weird museums.",
    "I live here now, on the island of Kauai. It’s not paradise, but it sometimes feels that way. It’s quite beautiful. The weather is nice. But we still have rainy days. We worry every year that we might get a hurricane - we occasionally do. Our roads have potholes, and their are places where the traffic is bad. The beaches are wonderful, but you can get sunburned. The people are nice here, but the tolerance for tourists acting like idiots can be tested. Things move slowly here, which is a good thing or a bad thing. Beautiful plants grow very fast here, but so do the weeds. If you need perfection to have paradise, we’re not there, but we’re closer than most places."
  ]; //list of content
  List<String> titles = [
    'Kerala',
    'Jammu and Kashmir',
    'Switzerland',
    'Netehrlands',
    'Canada',
    'Dubai',
    'Las Vegas',
    'London',
    'Rome',
    'Egypt',
    'Philadelphia',
    'Hawaii'
  ]; //list of titles
  Map<String, dynamic> send = {};
  int currentIndex = 0;
  dynamic data;
  @override
  Widget build(BuildContext context) {
    data='';
    data= data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    send = {
      'images': images,
      'content': content,
      'titles': titles
    }; // this data is sent to search delegate to respond to search queries
    return Scaffold(
      appBar: AppBar(
          title: Text('Destinations'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        emp:
                            send)); //on pressing the search icon the searching function is triggered by calling the Data Search Constructor
              },
            ),
          ]),
          drawer: Drawer(
        child: ListView(
          
          children: [
            Container(
              color: Colors.blue,
              child: DrawerHeader(
                
                child: Center(child: Text(data))
                ),
            ),

            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Upload'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Log Out'),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // used to identify the current tapped icon
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.home,
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.compass,
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.graduationCap,
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.bell,
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                FontAwesomeIcons.questionCircle,
              ),
              backgroundColor: Colors.white,
              label: '')
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Container(
          child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(boxShadow: [
              new BoxShadow(color: Colors.blueGrey, blurRadius: 20.0)
            ]),
            child: Card(
                child: InkWell(
              splashColor: Colors.blue,
              child: Column(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage('assets/' +
                        images[index 
                            ]), // modulus operator is used to use the 2 images over 12 grid boxes
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(titles[index],
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent)),
                SizedBox(
                  height: 10,
                ),
              ]),
              onTap: () {
                Navigator.pushNamed(context, '/mainBlog', arguments: {
                  'title': titles[index],
                  'image': images[index],
                  'content': content[index]
                }); // used to send data to the next screen . In this case data pertaining to the specific blog is sent
              },
            ))),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      )),
    );
  }
}
