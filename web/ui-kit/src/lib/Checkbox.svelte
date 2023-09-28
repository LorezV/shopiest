<script lang="ts">
    export let rtl: boolean = false;
    export let label: string = "Comments"
    export let description: string = "Get notified when someones posts a comment on a posting.";
    export let descriptionInline: boolean = false;
</script>

<label class="relative flex">
    <input type="checkbox" class="hidden"/>

    <div class="flex h-6 items-center z-50">
        <div class="h-4 w-4 rounded border border-gray-300 flex items-center justify-center text-xs text-transparent">
            <svg fill="currentColor" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="8px" height="8px" viewBox="0 0 45.701 45.7">
                <path d="M20.687,38.332c-2.072,2.072-5.434,2.072-7.505,0L1.554,26.704c-2.072-2.071-2.072-5.433,0-7.504
                    c2.071-2.072,5.433-2.072,7.505,0l6.928,6.927c0.523,0.522,1.372,0.522,1.896,0L36.642,7.368c2.071-2.072,5.433-2.072,7.505,0
                    c0.995,0.995,1.554,2.345,1.554,3.752c0,1.407-0.559,2.757-1.554,3.752L20.687,38.332z"/>
            </svg>
        </div>
    </div>

    {#if label.length > 0 || description.length > 0}
        <div class="{descriptionInline ? 'flex gap-x-1' : 'block'} ml-3 text-sm leading-6 z-50">
            {#if label.length > 0}
                <span class="font-medium text-gray-900">{label}</span>
            {/if}
            {#if description.length > 0}
                <p class="text-gray-500">{description}</p>
            {/if}
        </div>
    {/if}
</label>

<style>
    input:checked ~ div > div {
        @apply bg-indigo-600 border-indigo-600 text-white;
    }

    input:focus ~ div > div {
        @apply bg-red-400;
    }
</style>