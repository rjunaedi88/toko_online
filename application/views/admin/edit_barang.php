<div class="container-fluid">
	<h3><i class="fas fa-edit"></i>EDIT DATA BARANG</h3>

	<?php foreach ($barang as $brg) : ?>

		<form method="post" action="<?php echo base_url() . 'admin/data_barang/update' ?>">
			<div class="form-group">
				<label>Nama Barang</label>
				<input type="text" class="form-control" value="<?php echo $brg->nama_brg ?>" name="nama_brg">
			</div>

			<div class="form-group">
				<label>Keterangan</label>
				<input type="hidden" name="id_brg" value="<?php echo $brg->id_brg ?>" class="form-control">
				<input type="text" name="keterangan" value="<?php echo $brg->keterangan ?>" class="form-control">
			</div>

			<div class="form-group">
				<label>Kategori</label>
				<input type="text" name="kategori" value="<?php echo $brg->kategori ?>" class="form-control">
			</div>

			<div class="form-group">
				<label>Harga</label>
				<input type="text" name="harga" value="<?php echo $brg->harga ?>" class="form-control">
			</div>

			<div class="form-group">
				<label>Stok</label>
				<input type="text" name="stok" value="<?php echo $brg->stok ?>" class="form-control">
			</div>

			<button type="submit" class="btn btn-sm btn-primary">Simpan</button>

		</form>

	<?php endforeach; ?>
</div>