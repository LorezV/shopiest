<script context="module" lang="ts">
    import type { ComponentType } from "svelte";
</script>

<script lang="ts">
    export let id: string;
    export let name: string;
    export let value: string = "";
    export let placeholder: string = "";
    export let type: "text" | "password" = "text";

    export let label: string | undefined = undefined;
    export let icon: ComponentType | undefined = undefined;

    const input = (event: any) => (value = event.target?.value || "")
</script>

<div class="flex flex-col gap-y-2">
    {#if label !== undefined}
        <label class="font-medium" for={id}>{label}</label>
    {/if}

    <div class="relative flex items-center input-container">
        <input
            class="outline-none border rounded px-4 {icon !== undefined
                ? 'pl-10'
                : 'pl-4'} py-2 w-full focus:border-blue-200"
            {id}
            {name}
            {type}
            {placeholder}
            on:input={input}
        />

        {#if icon !== undefined}
            <svelte:component this={icon} class="absolute left-3" />
        {/if}
    </div>
</div>
