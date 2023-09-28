<script context="module">
    import IconChevronDown from "$lib/assets/icons/chevron-down.svg?component";
</script>

<script lang="ts">
    export let options: { name: string; value: any }[];
    export let value: any = null;

    let focused: boolean = false;
    let selectedOption: { name: string; value: any } = options[0];

    $: value = selectedOption?.value;
</script>

<div class="flex flex-col relative">
    <button
        class="px-4 py-2 flex items-center rounded text-left outline-none {focused
            ? 'border border-blue-200'
            : 'border'}"
        on:click={() => (focused = !focused)}
    >
        <span class="flex-1">{selectedOption.name}</span>

        <IconChevronDown class="transition-transform {focused ? "rotate-180" : "rotate-0"}" />
    </button>

    <div
        class="bg-white flex flex-col rounded shadow absolute w-full -bottom-0 overflow-hidden translate-y-full transition-all {focused
            ? 'max-h-40'
            : 'max-h-0'}"
    >
        <div class="py-2 flex flex-col overflow-y-auto">
            {#each options as option}
                <button
                    class="px-4 py-1 text-left hover:bg-neutral-100 outline-none"
                    on:click={() => {
                        selectedOption = option;

                        focused = !focused;
                    }}>{option.name}</button
                >
            {/each}
        </div>
    </div>
</div>
