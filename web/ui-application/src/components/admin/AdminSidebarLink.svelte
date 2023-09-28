<script lang="ts">
    import { page } from "$app/stores";

    export let href: string;

    $: active = $page.url.pathname === href;
</script>

<li class="flex flex-col">
    <a class="flex gap-x-2 items-center p-2 transition-all {active ? "active" : ""}" {href}><slot /></a>
</li>

<style>
    a:hover, a.active {
        @apply bg-blue-50 text-blue-600 rounded;
    }
</style>
