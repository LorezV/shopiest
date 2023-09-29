<script lang="ts">
    export let danger: boolean = false;
    export const type: "primary" | "dashed" | "link" | "text" | "default" = "default";
</script>

<button
    class="{colorClasses[type]} {sizedClasses[size]} {rounded
        ? 'rounded-full'
        : sizedRoundedClasses[size]}"
>
    <slot>Button</slot>
</button>
