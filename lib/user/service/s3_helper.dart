class S3Helper {
  static const String bucketUrl = 'https://nos.wjv-1.neo.id/tapatupa-prod/';

  /// Mendapatkan URL gambar objek retribusi berdasarkan kode objek retribusi
  static String getObjekRetribusiImageUrl(String kodeObjekRetribusi) {
    // Pastikan ekstensi file sesuai (.jpg, .png, dll)
    return '${bucketUrl}images/objekRetribusi/$kodeObjekRetribusi';
  }

  static String getTarifObjekRetribusiDocumentUrl(String kodeObjekRetribusi) {
    // Pastikan ekstensi file sesuai (.jpg, .png, dll)
    return '${bucketUrl}documents/tarifObjekRetribusi/$kodeObjekRetribusi';
  }

  static String getPerjanjianDocumentUrl(String nomorSuratPerjanjian) {
    // Pastikan ekstensi file sesuai (.pdf, .docx, dll)
    return '${bucketUrl}documents/PerjanjianSewa/$nomorSuratPerjanjian';
  }
}
