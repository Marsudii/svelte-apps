<script>
	let value = '';
	function handleSubmit() {
		console.log(value);
	}
</script>

<div>
	<form on:submit|preventDefault={handleSubmit}>
		<input type="text" bind:value />
		<button type="submit">Submit</button>
	</form>
	<p>{value}</p>
</div>
