<script context="module">
    import { Button } from "ui-kit";

    import AdminHeaderSearch from "./AdminHeaderSearch.svelte";

    import IconMenu from "$lib/assets/icons/menu.svg?component";
</script>

<script lang="ts">
    export let menuToggle: (...args: any[]) => any;
</script>

<header class="bg-white sticky top-0 p-3 border-b shadow-sm z-50">
    <div class="flex gap-x-3 items-center">
        <Button></Button>

        <button on:click={menuToggle}><IconMenu /></button>

        <AdminHeaderSearch />
    </div>
</header>
