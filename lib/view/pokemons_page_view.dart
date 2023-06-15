import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mobile_dev_test_sprout_prabowo/view/pokemon_detail_page_view.dart';
import 'package:mobile_dev_test_sprout_prabowo/view_model/pokemin_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PokemonPage extends StatefulWidget {
  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final viewModel = Provider.of<PokemonViewModel>(context, listen: false);
      viewModel.fetchPokemonList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('PokeAPI Demo')),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pokedex",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
              ),
              SizedBox(
                height: 18,
              ),
              Expanded(
                child: Consumer<PokemonViewModel>(
                  builder: (context, viewModel, _) {
                    if (viewModel.isLoading) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 5 / 4),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey.shade200,
                              child: Container(
                                height: 150,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 5 / 4),
                        itemCount: viewModel.pokemonList.length,
                        itemBuilder: (context, index) {
                          final pokemon = viewModel.pokemonList[index];

                          return FadeInLeft(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokemonDetailPage(
                                            pokemon: pokemon,
                                          )),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: pokemon.color,
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Icon(
                                          Icons.blur_on,
                                          size: 56,
                                          color: Colors.white30,
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex: 1, child: SizedBox()),
                                            Expanded(
                                              flex: 2,
                                              child: Image.network(
                                                pokemon.imageUrl,
                                                height: 150,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              pokemon.name.toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 14,
                                            ),
                                            for (var index = 0;
                                                index < pokemon.types.length;
                                                index++)
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 7),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                    vertical: 4),
                                                decoration: BoxDecoration(
                                                    color: Colors.white30,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                child: Text(
                                                  pokemon.types[index],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel =
              Provider.of<PokemonViewModel>(context, listen: false);
          viewModel.fetchPokemonList();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
