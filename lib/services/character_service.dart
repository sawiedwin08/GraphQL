import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../config/graphql_config.dart';
import '../models/character.dart';

class CharacterService {
  static final ValueNotifier<GraphQLClient> _client = GraphQLConfig.clientToQuery();

  static String getCharactersQuery = '''
    query {
      allPeople {
        people {
          name
      }
    }
  ''';

  Future<List<Character>> getCharacters() async {
    try {
      final QueryOptions options = QueryOptions(
        document: gql(getCharactersQuery),
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await _client.value.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final List<dynamic> charactersData = result.data?['allPeople']['people'] ?? [];
      return charactersData.map((charData) => Character.fromJson(charData)).toList();
    } catch (e) {
      throw Exception('Error fetching characters: $e');
    }
  }
}