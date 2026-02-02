import "package:flutter/material.dart";

void main() => runApp(
  MaterialApp(
    home: const SimpleUI(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(useMaterial3: true),
  ),
);

class SimpleUI extends StatelessWidget {
  const SimpleUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading:IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),title: const Text("Collections")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) => CollectionCard(index: index + 1),
      ),
    );
  }
}

class CollectionCard extends StatefulWidget {
  final int index;
  const CollectionCard({super.key, required this.index});

  @override
  State<CollectionCard> createState() => _CollectionCardState();
}

class _CollectionCardState extends State<CollectionCard> {
  bool _isExpanded = false;

  final int totalImages = 6;
  final int previewCount = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Collection ${widget.index}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            ),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),

          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: previewCount,
                  itemBuilder: (context, i) {
                    final isLast = i == previewCount - 1;
                    final remaining = totalImages - previewCount;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        children: [
                          _buildImage(i),
                          if (isLast && remaining > 0)
                            _buildOverlay("+$remaining"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
  Widget _buildImage(int i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        "https://picsum.photos/200?random=${widget.index}$i",
        width: 80,
        height: 100,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 80,
            height: 100,
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 80,
            height: 100,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Icon(Icons.broken_image),
          );
        },
      ),
    );
  }


  Widget _buildOverlay(String text) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
