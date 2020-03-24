import 'package:flutter/material.dart';
import 'package:covid19/services/NetworkHelper.dart';


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  Future <List> getData() async {
    NetworkHelper covidData = NetworkHelper('http://newsapi.org/v2/top-headlines?country=in&q=corona&from=2020-02-24&sortBy=publishedAt&apiKey=d9fa391aacfe428e81b8c6002ea8a507');
    var covidNews = await covidData.getData();
    var articles = covidNews['articles'];
    print(articles);
    return articles;
  }

  void initState() {
    super.initState();
    getData();
  }

  Future<Null> refresh() async{
    await getData();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data == null){
            return
                Container(
                  child: Center(
                    child: Text('Loading...'),
                  )
                );
          }
          else{
            return RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        color: Colors.blueAccent.withOpacity(0.5),
                        child: ListTile(
                          title: Text(
                              snapshot.data[index]['title'],
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 1.2,
                                color: Colors.white
                              ),
                          ),
                            subtitle: Text(
                                snapshot.data[index]['description'],
                              style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 0.9,
                              ),
                            ),
                          trailing: Container(
                            height: 50,
                            child: Image.network(
                              snapshot.data[index]['urlToImage'],
                              scale: 1,
                                filterQuality: FilterQuality.low,
                              height: 50,
                              fit: BoxFit.fitHeight
                            ),
                          ),
                          isThreeLine: true,
                          contentPadding: EdgeInsets.all(10.0),
                        ),
                      ),
                    );
                  }
              ),
            );
          }
          }

      )
    );
  }
}
//TODO: Integrate news page