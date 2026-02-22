import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final res = controller.ressource;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey.shade100,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      res.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${(controller.progress * 100).toStringAsFixed(1)} % completed - "
                      // multiply to know how many MB hae been downloaded so far
                      "${(res.size * controller.progress).toStringAsFixed(1)} of ${res.size} MB",
                      style: const TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: controller.progress,
                      minHeight: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: Icon(
                  controller.status == DownloadStatus.notDownloaded
                      ? Icons.download // show download icon
                      : controller.status == DownloadStatus.downloading
                      ? Icons.downloading // show a downloading icon
                      : Icons.folder, // downloaded
                ),
                onPressed: controller.status == DownloadStatus.notDownloaded
                    ? controller.startDownload
                    : null, // disable button if downloading or downloaded
              ),
            ],
          ),
        );
      },
    );
  }
}
