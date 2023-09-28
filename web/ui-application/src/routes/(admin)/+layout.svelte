<script context="module">
    import AdminSidebar from "../../components/admin/AdminSidebar.svelte";
    import AdminHeader from "../../components/admin/AdminHeader.svelte";
    import AdminFooter from "../../components/admin/AdminFooter.svelte";
</script>

<script>
    let sidebarExpanded = false;
</script>

<div class="flex h-screen overflow-hidden bg-neutral-100">
    <AdminSidebar bind:expanded={sidebarExpanded} />

    <div class="flex flex-col flex-1 overflow-y-auto overflow-x-hidden">
        <AdminHeader menuToggle={() => (sidebarExpanded = !sidebarExpanded)} />

        <main class="flex-1"><slot /></main>

        <AdminFooter />
    </div>
</div>