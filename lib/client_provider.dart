import 'dart:io';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

  String get host {
    if (Platform.isAndroid) {
      return '192.168.1.10';
    } else {
      return 'localhost';
    }
  }

  final String HTTP_ENDPOINT = 'http://$host:4000/api';
  final String WS_ENDPOINT = 'ws://$host:4000/socket';
/// Wraps the root application with the `graphql_flutter` client.
/// we use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({Key key, this.child}) : super(key: key);

  final Widget child;


  @override
  Widget build(BuildContext context) {

    Link link = HttpLink(uri: HTTP_ENDPOINT);
    final WebSocketLink websocketLink = WebSocketLink(
      url: WS_ENDPOINT,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
      ),
    );
    link = link.concat(websocketLink);

    final NormalizedInMemoryCache cache = NormalizedInMemoryCache(
      dataIdFromObject: typenameDataIdFromObject,
    );

    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: cache,
        link: link,
      ),
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: child,
      ),
    );
  }
}
