import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Status Saver'),
      ),
      body: _currentIndex == 0 ? ImageScreen() : VideoScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
        ],
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<File> _imageFiles = [];

  @override
  void initState() {
    super.initState();
    _loadStatusImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Images'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _imageFiles.length,
        itemBuilder: (context, index) {
          return Image.file(
            _imageFiles[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Future<void> _loadStatusImages() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Get the directory where WhatsApp status images are stored
      Directory statusDir = Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

      // List all files in the directory
      List<FileSystemEntity> files = statusDir.listSync();

      // Filter only image files
      List<File> imageFiles = files.where((file) => file.path.endsWith('.jpg')).map((file) => File(file.path)).toList();

      setState(() {
        _imageFiles = imageFiles;
      });
    } else {
      // Permission denied
      throw Exception('Storage permission denied.');
    }
  }
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<File> _videoFiles = [];

  @override
  void initState() {
    super.initState();
    _loadStatusVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp Videos'),
      ),
      body: ListView.builder(
        itemCount: _videoFiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_videoFiles[index].path),
          );
        },
      ),
    );
  }

  Future<void> _loadStatusVideos() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // Get the directory where WhatsApp status videos are stored
      Directory statusDir = Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');

      // List all files in the directory
      List<FileSystemEntity> files = statusDir.listSync();

      // Filter only video files
      List<File> videoFiles = files.where((file) => file.path.endsWith('.mp4')).map((file) => File(file.path)).toList();

      setState(() {
        _videoFiles = videoFiles;
      });
    } else {
      // Permission denied
      throw Exception('Storage permission denied.');
    }
  }
}
