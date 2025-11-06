import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_chat/models/message.dart';

class DatabaseService {
  final CollectionReference messagesCollection = FirebaseFirestore.instance
      .collection('messages')
      .withConverter(
          fromFirestore: Message.fromFirestore,
          toFirestore: (Message message, options) => message.toFirestore());

  Stream<List<Message>> getMessages() {
    return messagesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> addMessage(String text, String senderId) async {
    return await messagesCollection.add(
        Message(text: text, senderId: senderId, timestamp: Timestamp.now()));
  }
}
