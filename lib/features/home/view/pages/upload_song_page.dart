import 'dart:io';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player_app/core/theme/app_pallete.dart';
import 'package:music_player_app/core/utils.dart';
import 'package:music_player_app/core/widgets/custom_field.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  final songNameController = TextEditingController();
  final artistController = TextEditingController();
  Color selectedColor = Pallete.cardColor;
  File? selectedImage;
  File? selectedAudio;

  void selectAudio() async {
    final pickedAudio = await pickAudio();
    if (pickedAudio != null) {
      setState(() {
        selectedAudio = pickedAudio;
      });
    }
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    songNameController.dispose();
    artistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Song"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.cloud_upload_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: selectImage,
                child: selectedImage != null
                    ? SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 150,
                        width: double.infinity,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(color: Pallete.borderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.folder_open,
                              size: 40,
                            ),
                            SizedBox(height: 15),
                            Text("Select the thumbnail for your song")
                          ],
                        ),
                      ),
              ),
              const SizedBox(height: 40),
              CustomField(
                hintText: "Pick Song",
                controller: null,
                readOnly: true,
                onTap: selectAudio,
              ),
              const SizedBox(height: 10),
              CustomField(
                hintText: "Song Name",
                controller: songNameController,
              ),
              const SizedBox(height: 10),
              CustomField(
                hintText: "Artist",
                controller: artistController,
              ),
              const SizedBox(height: 10),
              ColorPicker(
                pickersEnabled: const {
                  ColorPickerType.wheel: true,
                },
                onColorChanged: (Color color) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
