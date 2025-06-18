import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client_model.dart';
import 'client_details_screen.dart';

class ClientScreen extends StatelessWidget {
  const ClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients'),
        backgroundColor: const Color(0xFF1A237E),
      ),
      body: clientProvider.clients.isEmpty
          ? const Center(
        child: Text(
          'No clients found.',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: clientProvider.clients.length,
        itemBuilder: (context, index) {
          final client = clientProvider.clients[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16.0),
              title: Text(
                client.fullName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A237E),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.email, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(client.emailAddress),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(client.phoneNumber),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF1A237E)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientDetailsScreen(client: client),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}