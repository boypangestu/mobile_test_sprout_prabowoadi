import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test_sprout_prabowo/model/pokemon_model.dart';

class PokemonDetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  int selecttedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: widget.pokemon.color,
              child: Column(
                children: [
                  Expanded(
                      child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Spin(
                          // animate: true,
                          child: Icon(
                            Icons.blur_on,
                            size: 190,
                            color: Colors.white30,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          // margin: EdgeInsets.only(top: 32),
                          // color: Colors.amber,
                          child: FadeIn(
                            child: Image.network(
                              widget.pokemon.imageUrl,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.pokemon.name.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "#0${widget.pokemon.id}".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                for (var index = 0;
                                    index < widget.pokemon.types.length;
                                    index++)
                                  Container(
                                    margin: EdgeInsets.only(right: 7),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Text(
                                      widget.pokemon.types[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                              ],
                            ),
                            // Spacer(),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: FadeInUp(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (var i = 0; i < 2; i++)
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selecttedTab = i;
                                    });
                                    print(selecttedTab);
                                  },
                                  child: Container(
                                    child: Text(
                                      i == 0 ? "About" : "Base Stats",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: i == selecttedTab
                                              ? Colors.black
                                              : Colors.grey),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: 18),
                          selecttedTab == 0
                              ? AboutSection(pokemon: widget.pokemon)
                              : StatsSection(pokemon: widget.pokemon),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  final Pokemon pokemon;

  const AboutSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Species"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Text("seed"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Height"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Text("${pokemon.height}"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Weight"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Text("${pokemon.weight}"),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Text("Abilities"),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Row(
                  children: [
                    for (var index = 0;
                        index < pokemon.abilities.length;
                        index++)
                      index == pokemon.abilities.length - 1
                          ? Text("${pokemon.abilities[index]}")
                          : Text("${pokemon.abilities[index]}, "),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}

class StatsSection extends StatelessWidget {
  final Pokemon pokemon;

  const StatsSection({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var index = 0; index < pokemon.stats.length; index++)
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child:
                            Text("${pokemon.stats[index].name}".toUpperCase()),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${pokemon.stats[index].value}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: pokemon.stats[index].value,
                                      child: Container(
                                        color: pokemon.color,
                                        height: 5,
                                      )),
                                  Expanded(
                                      flex: 100 - pokemon.stats[index].value,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        height: 5,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
