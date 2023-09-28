<script lang="ts">
    export let title: string;
</script>

<h3 class="font-medium text-gray-400 mb-3">{title}</h3>

<ul class="flex flex-col gap-y-1.5 mb-3">
    <slot />
</ul>
