import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:pokedex_app/core/styles/style_color.dart';
import 'package:pokedex_app/core/styles/style_text.dart';
import 'package:pokedex_app/core/utils/type_color_pokemon.dart';
import 'package:pokedex_app/core/utils/type_image_pokemon.dart';
import 'package:pokedex_app/features/home/presentations/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/features/home/presentations/pages/favorite_page.dart';
import 'package:pokedex_app/features/home/presentations/widgets/appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    _loadPage();
  }

  //  FUNCTION: LOAD PAGE
  void _loadPage() {
    context.read<PokemonBloc>().add(GetAllPokemon());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        onChanged: (query) {
          context.read<PokemonBloc>().add(GetSearchPokemon(query: query));
        },
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonSuccess) {
            final isNotFindPokemon = state.searchPokemon;

            if (isNotFindPokemon.isEmpty) {
              return Center(
                child: Text(
                  'No Pokémon found.',
                  style: StyleText.medium(),
                ),
              );
            }
            return SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 16, top: 16, left: 16, bottom: 31),
                child: Column(
                  children: [
                    Container(
                      height: 42,
                      decoration: BoxDecoration(
                        color: StyleColor.black33,
                        borderRadius: BorderRadius.circular(49),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('All Type',
                              style: StyleText.medium(
                                  fontSize: 16.0, colorText: StyleColor.white)),
                          Gap(4),
                          Icon(Icons.keyboard_arrow_down_rounded,
                              color: StyleColor.white, size: 10),
                        ],
                      ),
                    ),
                    Gap(8),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: state.searchPokemon.length,
                      itemBuilder: (context, index) {
                        final data = state.searchPokemon[index];
                        return Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: StyleColor.black, width: 1)),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      height: 102,
                                      color: StyleColor.white,
                                      padding:
                                          EdgeInsets.only(left: 16, top: 12),
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data.name}',
                                            style: StyleText.semiBold(
                                                fontSize: 21.0),
                                          ),
                                          Row(
                                            children: data.typeofpokemon!.map(
                                              (e) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4.0),
                                                  child: Container(
                                                    height: 36,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 6,
                                                            vertical: 2.9),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              48.61),
                                                      color:
                                                          typeColorPokemon(e),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 20.31,
                                                            backgroundColor:
                                                                StyleColor
                                                                    .white,
                                                            child: SvgPicture
                                                                .asset(
                                                              typeImagePokemon(
                                                                  e),
                                                              height: 13.06,
                                                              width: 13.06,
                                                            )),
                                                        Gap(2.6),
                                                        Text(
                                                          '${e.toString()}',
                                                          style:
                                                              StyleText.medium(
                                                                  fontSize:
                                                                      11.0),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                          )
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: typeColorPokemon(
                                              data.typeofpokemon!.first),
                                        ),
                                        child: CachedNetworkImage(
                                          height: 94,
                                          width: 94,
                                          imageUrl: "${data.imageurl}",
                                          placeholder: (context, url) => Center(
                                            child: Text(
                                              'Loading...',
                                              style: StyleText.medium(),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(child: Icon(Icons.error)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Gap(6);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is PokemonError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: StyleText.regular(),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
