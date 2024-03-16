import 'package:archive/archive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArchiveState extends StateNotifier<Archive> {
  ArchiveState() : super(Archive());

  void setArchive(Archive archive) {
    print("Archive Created");
    state = archive;
  }
}

final archiveProvider =
    StateNotifierProvider<ArchiveState, Archive?>((ref) => ArchiveState());
