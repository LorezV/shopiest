<script context="module">
    import IconSearch from "$lib/assets/icons/search.svg?component";
    import IconClose from "$lib/assets/icons/close.svg?component";
</script>

<script lang="ts">
    export let value: string = "";
</script>

<div class="relative flex items-center">
    <IconSearch class="absolute text-gray-400 left-2" />

    <input
        class="bg-neutral-100 px-8 py-2 outline-none rounded"
        placeholder="Search..."
        type="text"
        bind:value
    />

    {#if value.length > 0}
        <button class="absolute right-2 opacity-0" on:click={() => (value = "")}>
            <IconClose class="w-[16px] h-[16px]" />
        </button>
    {/if}
</div>

<style lang="scss">
    input:focus {
        ~ button {
            opacity: 100% !important;
        }
    }
</style>
