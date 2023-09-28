<script context="module">
    import Input from "../../../../components/elements/Input.svelte";
    import TextArea from "../../../../components/elements/TextArea.svelte";
    import Select from "../../../../components/elements/Select.svelte";
    import InputFile from "../../../../components/elements/InputFile.svelte";
</script>

<script>
</script>

<section class="p-5">
    <div class="flex gap-5 max-md:flex-col">
        <div class="flex flex-col gap-5 md:w-3/5">
            <div class="bg-white p-3 rounded">
                <div class="flex flex-col gap-y-3">
                    <Input
                        id="i-title"
                        name="title"
                        label="Product Title"
                        placeholder="Enter product title"
                    />

                    <TextArea
                        id="i-description"
                        name="description"
                        label="Product Description"
                        placeholder="Enter product pescription"
                    />
                </div>
            </div>

            <div class="bg-white rounded">
                <div class="p-3 border-b">
                    <h3 class="font-medium">Product Gallery</h3>
                </div>
                <div class="p-3">
                    <div class="flex flex-col gap-y-3">
                        <InputFile id="i-images" name="images" label="Product Gallery" text="Add Product Gallery Images." />
                    </div>
                </div>
            </div>
        </div>
        <div class="flex flex-col gap-5 flex-1">
            <div class="bg-white p-3 rounded">
                <div class="flex flex-col gap-y-3">
                    <Select
                        options={[
                            { name: "One", value: 1 },
                            { name: "Two", value: 2 },
                            { name: "Two", value: 2 },
                            { name: "Two", value: 2 },
                            { name: "Two", value: 2 },
                            { name: "Two", value: 2 },
                        ]}
                    />
                </div>
            </div>
        </div>
    </div>
</section>
