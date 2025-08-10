import 'package:detectai_project/constants/app_colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatefulWidget {
  final String title;
  final String description;
  final List<String> allowedExtensions;
  const UploadFile({
    super.key,
    required this.title,
    required this.description,
    required this.allowedExtensions,
  });

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  String? selectedFileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions,
      //['jpeg', 'pdf', 'mp4'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          //'Upload any files belonging to the victim',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textLight,
          ),
        ),
        SizedBox(height: 4),
        Text(
          widget.description,
          //'any files related to the victim, including photos, videos or files. (.jpeg .pdf .mp4)',
          style: TextStyle(fontSize: 12, color: AppColors.hintColor),
        ),
        const SizedBox(height: 12),
        // مربع التحميل
        InkWell(
          onTap: pickFile,
          child: Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              color: AppColors.cards,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.textFormFeild,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.insert_drive_file_rounded,
                    size: 40,
                    color: AppColors.textLight,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    selectedFileName ?? 'Select file',
                    style: const TextStyle(
                      color: AppColors.textLight,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
