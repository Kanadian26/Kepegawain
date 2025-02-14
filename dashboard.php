<?php
include 'tampilan/navbar.php';
require_once 'config/config.php';

// Query untuk mendapatkan statistik
$query_total_pegawai = "SELECT COUNT(*) as total FROM pegawai";
$result_total_pegawai = mysqli_query($koneksi, $query_total_pegawai);
$total_pegawai = mysqli_fetch_assoc($result_total_pegawai)['total'];

$query_total_departemen = "SELECT COUNT(*) as total FROM departemen";
$result_total_departemen = mysqli_query($koneksi, $query_total_departemen);
$total_departemen = mysqli_fetch_assoc($result_total_departemen)['total'];

$query_total_jabatan = "SELECT COUNT(*) as total FROM jabatan";
$result_total_jabatan = mysqli_query($koneksi, $query_total_jabatan);
$total_jabatan = mysqli_fetch_assoc($result_total_jabatan)['total'];

// Query untuk statistik pegawai berdasarkan jenis kelamin
$query_pegawai_gender = "
    SELECT 
        jenis_kelamin, 
        COUNT(*) as total,
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM pegawai), 2) as persentase
    FROM pegawai 
    GROUP BY jenis_kelamin
";
$result_pegawai_gender = mysqli_query($koneksi, $query_pegawai_gender);
$pegawai_gender = mysqli_fetch_all($result_pegawai_gender, MYSQLI_ASSOC);

// Query untuk statistik pegawai berdasarkan departemen
$query_pegawai_departemen = "
    SELECT 
        d.nama_departemen, 
        COUNT(p.id) as total_pegawai
    FROM departemen d
    LEFT JOIN pegawai p ON d.id = p.id_departemen
    GROUP BY d.id, d.nama_departemen
    ORDER BY total_pegawai DESC
";
$result_pegawai_departemen = mysqli_query($koneksi, $query_pegawai_departemen);
?>

<div class="container mx-auto px-4 py-8">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-blue-600 text-white rounded-lg shadow-md p-6 hover:bg-blue-700 transition duration-300">
            <div class="flex justify-between items-center">
                <div>
                    <h3 class="text-lg font-semibold">Total Pegawai</h3>
                    <p class="text-3xl font-bold"><?php echo $total_pegawai; ?></p>
                </div>
                <i class="fas fa-users text-4xl opacity-50"></i>
            </div>
        </div>
        
        <div class="bg-blue-600 text-white rounded-lg shadow-md p-6 hover:bg-blue-700 transition duration-300">
            <div class="flex justify-between items-center">
                <div>
                    <h3 class="text-lg font-semibold">Total Departemen</h3>
                    <p class="text-3xl font-bold"><?php echo $total_departemen; ?></p>
                </div>
                <i class="fas fa-building text-4xl opacity-50"></i>
            </div>
        </div>

        <div class="bg-blue-600 text-white rounded-lg shadow-md p-6 hover:bg-blue-700 transition duration-300">
            <div class="flex justify-between items-center">
                <div>
                    <h3 class="text-lg font-semibold">Total Jabatan</h3>
                    <p class="text-3xl font-bold"><?php echo $total_jabatan; ?></p>
                </div>
                <i class="fas fa-briefcase text-4xl opacity-50"></i>
            </div>
        </div>
    </div>

    <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
        <!-- Statistik Pegawai Berdasarkan Jenis Kelamin -->
        <div class="bg-white shadow-md rounded-lg p-6">
            <h3 class="text-xl font-semibold mb-4 text-gray-800">Komposisi Pegawai</h3>
            <div class="space-y-4">
                <?php foreach($pegawai_gender as $gender): ?>
                <div>
                    <div class="flex justify-between text-sm text-gray-600 mb-1">
                        <span><?php echo $gender['jenis_kelamin']; ?></span>
                        <span><?php echo $gender['total'] . ' (' . $gender['persentase'] . '%)'; ?></span>
                    </div>
                    <div class="bg-blue-200 h-2 rounded-full">
                        <div class="bg-blue-600 h-2 rounded-full" style="width: <?php echo $gender['persentase']; ?>%"></div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>

        <!-- Statistik Pegawai Berdasarkan Departemen -->
        <div class="bg-white shadow-md rounded-lg p-6">
            <h3 class="text-xl font-semibold mb-4 text-gray-800">Pegawai per Departemen</h3>
            <table class="w-full">
                <thead>
                    <tr class="bg-gray-100 text-gray-600">
                        <th class="py-2 px-4 text-left">Departemen</th>
                        <th class="py-2 px-4 text-right">Jumlah Pegawai</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while($departemen = mysqli_fetch_assoc($result_pegawai_departemen)): ?>
                    <tr class="border-b">
                        <td class="py-2 px-4"><?php echo $departemen['nama_departemen']; ?></td>
                        <td class="py-2 px-4 text-right"><?php echo $departemen['total_pegawai']; ?></td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>