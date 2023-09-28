<script lang="ts">
    export let type: "primary" | "secondary" | "soft" = "primary";
    export let size: "sm" | "base" | "lg" | "xl" | "2xl" = "base";
    export let rounded: boolean = false;

    function getSizedClasses(size: string, rounded: boolean): Array<string> {
        if (size === "sm")
            return [rounded ? "rounded-full" : "rounded", "px-2", "py-1", 'text-xs']

        if (size === "base")
            return [rounded ? "rounded-full" : "rounded", "px-2", "py-1", "text-sm"]

        if (size === "lg")
            return [rounded ? "rounded-full" : "rounded-md", "px-2.5", "py-1.5", "text-sm"]

        if (size === "xl")
            return [rounded ? "rounded-full" : "rounded-md", "px-3", "py-2", "text-sm"]

        if (size === "2xl")
            return [rounded ? "rounded-full" : "rounded-md", "px-3.5", "py-2.5", "text-sm"]

        return []
    }

    function getColorClasses(type: string): Array<string> {
        if (type === "primary")
            return ["bg-indigo-600", 'text-white', "hover:bg-indigo-500", "focus-visible:outline-indigo-600"]

        if (type === "secondary")
            return ["bg-white", "text-gray-900", "ring-1", "ring-inset", "ring-gray-300", "hover:bg-gray-50", "focus-visible:outline-gray-300"]

        if (type === "soft")
            return ["bg-indigo-50", "text-indigo-600", "hover:bg-indigo-100", "focus-visible:outline-indigo-400"]

        return []
    }

    function getClasses(type: string, size: string, rounded: boolean): string {
        return [...getColorClasses(type), ...getSizedClasses(size, rounded)].join(" ")
    }

    $: classes = getClasses(type, size, rounded)
</script>

<button type="button" class="{classes} font-semibold shadow-sm focis-visible:outline focus-visible:outline-2 focus-visible:outline-2 focus-visible:outline-offset-2">
    <slot>Button</slot>
</button>