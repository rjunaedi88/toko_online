<div class="container-fluid">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-8">
			<div class="btn btn-info">
				<?php 
				$grand_total = 0;
				if ($keranjang = $this->cart->contents()) 
				{
				  foreach ($keranjang as $item)
				  {
				  	$grand_total = $grand_total + $item['subtotal'];
				  }

				  echo "Total Belanja Anda = Rp." . number_format($grand_total,0,',','.');

				 ?>
			</div><br><br>

			<h3>Input Alamat Pengiriman dan Pembayaran Anda :</h3>

			<form method="post" action="<?php echo base_url('dashboard/proses_pesanan') ?>">
				<div class="form-group">
					<label>Nama Lengkap</label>
					<input type="text" class="form-control" placeholder="Nama lengkap anda" name="nama">
				</div>

				<div class="form-group">
					<label>Alamat Lengkap</label>
					<input type="text" class="form-control" placeholder="Alamat lengkap anda" name="alamat">
				</div>

				<div class="form-group">
					<label>No Telepon</label>
					<input type="text" class="form-control" placeholder="No Telepon anda" name="no_telp">
				</div>

				<div class="form-group">
					<label>Jasa Pengiriman</label>
					<select class="form-control">
						<option>JNE</option>
						<option>TIKI</option>
						<option>POS Indonesia</option>
						<option>GOJEK</option>
						<option>GRAB</option>
					</select>
				</div>

				<div class="form-group">
					<label>Bank Transfer</label>
					<select class="form-control">
						<option>BCA - XXXXXXX</option>
						<option>BRI - XXXXXXX</option>
						<option>BNI - XXXXXXX</option>
						<option>MANDIRI - XXXXXXX</option>
						<option>OVO - XXXXXXX</option>
					</select>
				</div>

				<button type="submit" class="btn btn-sm btn-primary mb-5">Pesan</button>
			</form>

			<?php 
			} else {
				echo "Keranjang Belanja Anda Masih Kosong";
			}
			 ?>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>