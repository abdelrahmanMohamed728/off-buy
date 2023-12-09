import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:off_buy/products/bloc/products_bloc.dart';
import 'package:off_buy/products/event/get_products_event.dart';
import 'package:off_buy/shared/model/states.dart';
import 'package:off_buy/shared/view/loading.dart';
import 'package:off_buy/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _productsBloc = ProductsBloc(OffBuyInitial());

  @override
  void initState() {
    _productsBloc.add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: BlocProvider(
          create: (_) => _productsBloc,
          child: BlocBuilder<ProductsBloc, OffBuyState>(
            builder: (context, state) {
              if (state is OffBuyLoading) {
                return const LoadingView();
              } else if (state is OffBuyError) {
                return Text(state.message != null ? state.message! : "");
              } else if (state is OffBuyLoaded) {
                final data = (state.offBuyModel as List<dynamic>);
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(data.length.toString()),
                );
              } else {
                return const Text("Starting");
              }
            },
          ),
        ));
  }
}
