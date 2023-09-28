<script context="module">
    import AdminSidebarSection from "./AdminSidebarSection.svelte";
    import AdminSidebarLink from "./AdminSidebarLink.svelte";
    import AdminSidebarLinkGroup from "./AdminSidebarLinkGroup.svelte";

    import IconDashboard from "$lib/assets/icons/dashboard.svg?component";
    import IconProduct from "$lib/assets/icons/product.svg?component";

    import IconClose from "$lib/assets/icons/close.svg?component";
</script>

<script lang="ts">
    import { page } from "$app/stores";
    import { onMount } from "svelte";

    export let mounted: boolean = false,
        expanded: boolean = false;

    $: if (globalThis.localStorage !== undefined && mounted) {
        localStorage.setItem("sidebar", String(expanded));
    }

    onMount(() => {
        mounted = true;
        expanded = localStorage.getItem("sidebar") === "true";
    });
</script>

<aside
    class="bg-white p-3 h-screen z-50 border-r shadow flex flex-col gap-y-5 overflow-hidden relative transition-all duration-500 max-md:absolute max-md:top-0 hover:w-60 {expanded
        ? 'w-60 max-md:left-0'
        : 'w-0 max-md:-left-full'}"
>
    {#if expanded}
        <button
            class="absolute right-3 top-3 md:hidden text-gray-600"
            on:click={() => (expanded = false)}
        >
            <IconClose />
        </button>
    {/if}

    <div class="flex flex-col overflow-hidden overflow-y-auto">
        <nav>
            <AdminSidebarSection title="ECommerce">
                <AdminSidebarLinkGroup
                    open={$page.url.pathname.includes("/product/")}
                    title="Product"
                    icon={IconProduct}
                >
                    <AdminSidebarLink href="#">List</AdminSidebarLink>
                    <AdminSidebarLink href="/product/create"
                        >Create</AdminSidebarLink
                    >
                </AdminSidebarLinkGroup>
            </AdminSidebarSection>

            <AdminSidebarSection title="ECommerce">
                <AdminSidebarLinkGroup
                    open={$page.url.pathname.includes("/dashboard/")}
                    title="Product"
                    icon={IconDashboard}
                >
                    <AdminSidebarLink href="#">List</AdminSidebarLink>
                    <AdminSidebarLink href="/dashboard/crm"
                        >Create</AdminSidebarLink
                    >
                </AdminSidebarLinkGroup>
            </AdminSidebarSection>
        </nav>
    </div>
</aside>
