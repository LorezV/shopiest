<script context="module" lang="ts">
    import type { ComponentType } from "svelte";
    import IconChevronUp from "$lib/assets/icons/chevron-up.svg?component";
</script>

<script lang="ts">
    export let icon: ComponentType | undefined;
    export let title: string;
    export let open: boolean;

    function click(event: MouseEvent) {
        event.preventDefault();

        open = !open;
    }
</script>

<li class="flex flex-col">
    <button
        class="flex gap-x-2 items-center p-2 transition-all {open
            ? 'opened'
            : ''}"
        on:click={click}
    >
        <div>
            <svelte:component this={icon} />
        </div>

        <span>{title}</span>

        <IconChevronUp class="ml-auto rotate-180" />
    </button>

    <ul
        class="flex flex-col gap-y-1.5 overflow-hidden transition-all {open
            ? 'max-h-screen pt-1.5'
            : 'max-h-0 pt-0'}"
    >
        <slot />
    </ul>
</li>

<style lang="scss">
    ul {
        @apply ml-3;

        :global(> li > a) {
            @apply px-2 py-1 transition-colors;
        }

        :global(> li > a::before) {
            content: "◦";
            display: inline-block;
            margin-right: 1.25rem;
        }

        :global(> li > a:hover), :global(> li > a.active) {
            background: none;
        }
    }

    button:hover,
    button.opened {
        @apply bg-blue-50 text-blue-600 rounded;
    }
</style>
