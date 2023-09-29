import { sveltekit } from '@sveltejs/kit/vite';
import svgLoader from '@poppanator/sveltekit-svg';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [
		sveltekit(),
		svgLoader({
			includePaths: ['./src/lib/assets/icons/']
		}),
	]
});
