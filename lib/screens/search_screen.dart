import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/constants.dart';
import 'package:go_router/go_router.dart';
import '../widgets/bottom_menu.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> searchResults = [];
  bool isLoading = false;

  void _performSearch(String query) {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        searchResults = [
          'Kimya Ders İçeriği: Kimyasal Tepkimeler, Asitler ve Bazlar, Kimyasal Denge',
          'Matematik Ders İçeriği: Sayılar, Denklemler, Fonksiyonlar',
          'Biyoloji Ders İçeriği: Hücre, Genetik, Ekosistem',
        ]
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaplanrenkim,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go("/home");
          },
          icon: const Icon(CupertinoIcons.return_icon),
        ),
        title: const Text("Arama"),
        backgroundColor: arkaplanrenkim,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (query) {
                if (query.isNotEmpty) {
                  _performSearch(query);
                } else {
                  setState(() {
                    searchResults.clear();
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Ders veya içerik ara',
                prefixIcon: const Icon(CupertinoIcons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (searchResults.isEmpty)
              const Center(child: Text("Arama sonucu bulunamadı."))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(searchResults[index]),
                      onTap: () {
                        // Sonuca tıklandığında yapılacak işlem
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
