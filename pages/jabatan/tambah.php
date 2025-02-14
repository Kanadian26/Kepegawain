<?php
include '../../tampilan/navbar.php';
require_once '../../config/config.php';

// Query untuk mendapatkan daftar departemen
$query_departemen = "SELECT * FROM departemen";
$result_departemen = mysqli_query($koneksi, $query_departemen);
?>

<div class="container mx-auto px-4 py-8">
    <div class="max-w-md mx-auto bg-white shadow-md rounded-lg overflow-hidden">
        <div class="p-6 bg-gray-50 border-b">
            <h3 class="text-xl font-semibold text-gray-800">Tambah Jabatan Baru</h3>
        </div>
        
        <form action="../../proses/jabatan/proses_tambah.php" method="POST" class="p-6">
            <div class="mb-4">
                <label for="nama_jabatan" class="block text-gray-700 text-sm font-bold mb-2">Nama Jabatan</label>
                <input type="text" name="nama_jabatan" id="nama_jabatan" required 
                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="Masukkan nama jabatan">
            </div>

            <div class="mb-4">
                <label for="id_departemen" class="block text-gray-700 text-sm font-bold mb-2">Departemen</label>
                <select name="id_departemen" id="id_departemen" required
                        class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500">
                    <option value="">Pilih Departemen</option>
                    <?php while($departemen = mysqli_fetch_assoc($result_departemen)): ?>
                        <option value="<?php echo $departemen['id']; ?>">
                            <?php echo htmlspecialchars($departemen['nama_departemen']); ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>

            <div class="mb-6">
                <label for="gaji" class="block text-gray-700 text-sm font-bold mb-2">Gaji</label>
                <input type="text" name="gaji" id="gaji" required 
                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:ring-2 focus:ring-blue-500"
                       placeholder="Masukkan gaji"
                       onkeyup="formatRupiah(this)">
            </div>

            <div class="flex items-center justify-end space-x-4">
                <a href="index.php" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                    Batal
                </a>
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    Simpan
                </button>
            </div>
        </form>
    </div>
</div>

</body>
<script>
function formatRupiah(input) {
    // Hapus karakter selain angka
    let value = input.value.replace(/[^\d]/g, '');
    
    // Format dengan titik sebagai pemisah ribuan
    input.value = formatNumber(value);
}

function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
</script>
</html>