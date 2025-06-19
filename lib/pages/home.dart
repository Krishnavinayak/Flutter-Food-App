import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food/models/catergory_model.dart';
import 'package:food/models/diet_model.dart';
import 'package:food/models/popular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDiet> popular = [];

  void _getInfo() {

    categories = CategoryModel.getCategories();
     diets = DietModel.getDiets();
     popular = PopularDiet.getPopular();
  }
  @override
  void initState() {
    super.initState();
    _getInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breakfast",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: 
          Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/arrow-left-2-svgrepo-com.svg',
          height: 20,
          width: 20,),
        ),
        actions:[
          Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset('assets/icons/icons8-menu.svg',
          height: 20,
          width: 20,),
        ),

        ],
      ),
      body:ListView(
          children: [
            _searchfield(),
            SizedBox(height: 15,),
            _categories_method(),
            SizedBox(height: 15,),
            Recommend(),
            SizedBox(height: 15),
            scroll(),
            SizedBox(height: 15,),
            Popular(),
            SizedBox(height: 15,),
            Popfoods()

        
          ],
        ),
    );
  }

  ListView Popfoods() {
    return ListView.separated(
            itemCount: popular.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 25,),
            padding: EdgeInsets.only(
              left: 20,
              right: 20
            ),
            itemBuilder: (context, index){
            return Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(popular[index].iconPath,
                  width: 50,
                  height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popular[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16
                        ),
                      ),
                      Text(
                        popular[index].time + '|' + popular[index].rating,
                        style: TextStyle(
                          color: Color(0XFF786f72),
                          fontSize: 13,
                          fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  )
                  ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    offset: Offset(0, 10),
                    blurRadius: 40,
                    spreadRadius: 0
                  )
                ]
              ),
            );
          },
          );
  }

  Column Popular() {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Popular",
                style: TextStyle(color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600),
                )
              ),
              ],
          );
  }

  SizedBox scroll() {
    return SizedBox( // SizedBox sets fixed height
height: 300,
child: ListView.separated(
  itemBuilder: (context, index) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: diets[index].boxColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(diets[index].iconPath,
            height: 100,
            width: 100,),
          ),
          Text(diets[index].name, style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
          ),),

          Text(diets[index].level + '|' + diets[index].duration + '|' + diets[index].calorie, style: TextStyle(
            color: Color(0xff786F72),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),),
          Container(
            height: 45,
            width: 130,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.cyan, Colors.green]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text('View', style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),),
            ),
          ),
        ],
      ),
    );
  },
  separatorBuilder: (context, index) => SizedBox(width: 25),
  itemCount: diets.length,
  scrollDirection: Axis.horizontal,
  padding: EdgeInsets.only(left: 20, right: 20),
),
);
  }

  Padding Recommend() {
    return Padding(
padding: const EdgeInsets.only(left: 20),
child: Text(
  "Recommendations",
  style: TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
),
);
  }

  Column _categories_method() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Category",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 120,
              child: ListView.separated(
                itemCount: categories.length, 
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                separatorBuilder: (context, index) => SizedBox(width: 25),
                
                itemBuilder: (context, index){
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(categories[index].iconPath,
                            height: 15,
                            width: 15,),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Container _searchfield() {
    return Container(
          margin: EdgeInsets.only(top:40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow:[BoxShadow(
              color: Colors.black.withOpacity(0.33),
              blurRadius: 40,
              spreadRadius: 0.0)
      ]),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.all(15),
              hintText: "Search Food" ,
              hintStyle: TextStyle(
                color: Colors.blueGrey,
                fontSize: 14
              ),
              prefixIcon: Padding(padding: const EdgeInsets.all(12),
              child : SvgPicture.asset('assets/icons/icons8-search.svg')),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                      ),
                      Padding(padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset('assets/icons/filter-svgrepo-com.svg'),),
                    ],
                  ),
                ),
              )
            ),
          )
        );
  }
}