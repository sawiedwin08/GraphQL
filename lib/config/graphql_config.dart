import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    'https://swapi-graphql.netlify.app/',
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())),
    );
  }
}