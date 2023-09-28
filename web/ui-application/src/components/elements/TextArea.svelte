<script lang="ts">
    export let id: string;
    export let name: string;
    export let value: string = "";
    export let placeholder: string = "";

    export let label: string | undefined = undefined;
</script>

<div class="flex flex-col gap-y-2">
    {#if label !== undefined}
        <label class="font-medium" for={id}>{label}</label>
    {/if}

    <textarea
        class="outline-none border rounded px-4 py-2 focus:border-blue-200"
        cols="30"
        rows="10"
        {id}
        {name}
        {placeholder}
        bind:value
    />
</div>
