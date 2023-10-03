import { Input, TextArea, FileUpload } from "@/components";

export default function ProductCreatePage() {
    return (
        <form className="grid sm:grid-cols-3 gap-5 p-5">
            <div className="sm:col-span-2 flex flex-col gap-y-5">
                <div className="bg-white p-5 flex flex-col gap-y-5">
                    <h4 className="text-lg font-medium">Product information</h4>

                    <Input placeholder="Product title" />

                    <TextArea className="resize-none" placeholder="Product description" />

                    <div className="flex gap-x-5">
                        <Input type="number" className="flex-1" placeholder="Price, $" />
                        <Input type="number" className="flex-1" placeholder="Sale, %" />
                    </div>
                </div>

                <div className="bg-white p-5 flex flex-col gap-y-5">
                    <h4 className="text-lg font-medium">Product gallery</h4>

                    <FileUpload multiple />

                    <FileUpload />
                </div>
            </div>
            <div>
                <div className="bg-white p-5">11</div>
            </div>
        </form>
    )
}