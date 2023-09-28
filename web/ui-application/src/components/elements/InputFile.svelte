<script context="module">
  import IconTrash from "$lib/assets/icons/trash.svg?component";
  import IconUpload from "$lib/assets/icons/upload.svg?component";
  import IconFile from "$lib/assets/icons/file.svg?url";
</script>

<script lang="ts">
  export let id: string;
  export let name: string;
  export let label: string | undefined = "";
  export let text: string | undefined = "";
  export let multiple: boolean = true;

  export let files: FileList | undefined = undefined;

  function deleteFile(index: number) {
    if (files !== undefined && files.length > index) {
      const dt = new DataTransfer();

      for (let i = 0; i < files.length; i++) {
        if (index == i) continue;

        const file = files.item(i);

        if (file !== null) {
          dt.items.add(file);
        }
      }

      files = dt.files;
    }
  }

  function getFileSize(file: File) {
    const prefixes = ["B", "KB", "MB", "GB", "TB"];
    let i = 0;
    let currentSize = file.size;
    let currentPrefix = prefixes[i];

    while (currentSize > 1024) {
      if (i >= prefixes.length - 1) break;

      currentPrefix = prefixes[++i];

      currentSize = currentSize / 1024;
    }

    return `${(
      Math.round(currentSize * 100) / 100
    ).toLocaleString()} ${currentPrefix}`;
  }

  function getFileImageSrc(file: File) {
    const isImage = file.type.split("/").includes("image");

    if (isImage) {
      return URL.createObjectURL(file);
    }

    return IconFile;
  }
</script>

<input class="hidden" type="file" {multiple} {id} {name} bind:files />

<div class="flex flex-col">
  {#if label !== undefined}
    <label class="font-medium" for={id}>{label}</label>
  {/if}

  {#if text !== undefined}
    <span class="text-gray-400">{text}</span>
  {/if}

  <label
    for={id}
    class="cursor-pointer border-2 mt-3 rounded border-dashed flex flex-col items-center justify-center gap-y-3 p-10"
  >
    <IconUpload class="text-gray-400 w-[98px] h-[98px]" />
    <span>Drop files here or click to upload.</span>
  </label>

  {#if files !== undefined}
    <div class="flex flex-col gap-y-2 mt-3">
      {#each files as file, i}
        <div class="flex gap-x-3 items-center p-3 border rounded">
          <div>
            <img
              class="block w-[32px]"
              src={getFileImageSrc(file)}
              alt={file.name}
            />
          </div>
          <div class="flex-1">
            <div>{file.name}</div>
            <div class="text-sm text-gray-400">{getFileSize(file)}</div>
          </div>
          <div>
            <button
              class="bg-red-400 text-white rounded p-2"
              on:click={() => deleteFile(i)}
            >
              <IconTrash />
            </button>
          </div>
        </div>
      {/each}
    </div>
  {/if}
</div>
