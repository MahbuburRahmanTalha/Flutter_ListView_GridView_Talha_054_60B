import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _taskController = TextEditingController();
  final List<String> _tasks = [];

  void _addTask() {
    final task = _taskController.text.trim();
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
        _taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _addTask, child: const Text('Add')),
              ],
            ),
            const SizedBox(height: 20),

            // List
            Expanded(
              child:
                  _tasks.isEmpty
                      ? const Center(child: Text('No tasks yet!'))
                      : ListView.builder(
                        itemCount: _tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.task),
                            title: Text(_tasks[index]),
                          );
                        },
                      ),
            ),

            const SizedBox(height: 10),
            const Text(
              'Favorite Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // GridView
            SizedBox(
              height: 120,
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  CategoryCard(name: 'Work'),
                  CategoryCard(name: 'Study'),
                  CategoryCard(name: 'Home'),
                  CategoryCard(name: 'Fitness'),
                  CategoryCard(name: 'Shopping'),
                  CategoryCard(name: 'Others'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;

  const CategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
