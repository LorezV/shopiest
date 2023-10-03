import { Input, TextArea, FileUpload, Tabs, Select } from "@/components";

export default function ProductCreatePage() {
    return (
        <form className="grid sm:grid-cols-3 gap-5 p-5">
            <div className="sm:col-span-2 flex flex-col gap-y-5">
                <div className="bg-white p-5 flex flex-col gap-y-5">
                    <h4 className="text-lg font-medium">Product information</h4>

                    <Input className="border" placeholder="Product title" />

                    <TextArea className="border resize-none" placeholder="Product description" />
                </div>

                <div className="bg-white p-5 flex flex-col">
                    <Tabs tabs={[
                        {
                            title: "General info",
                            node: (
                                <div className="flex flex-col gap-y-5 mt-5">
                                    <div className="flex gap-x-5">
                                        <Input className="flex-1 border" placeholder="Manufacturer Name" />
                                        <Input className="flex-1 border" placeholder="Manufacturer Brand" />
                                    </div>

                                    <div className="flex gap-x-5">
                                        <Input type="number" className="flex-1" placeholder="Stocks" />
                                        <Input type="number" className="flex-1" placeholder="Price, $" />
                                        <Input type="number" className="flex-1" placeholder="Sale, %" />
                                        <Input type="number" className="flex-1" placeholder="Orders" />
                                    </div>
                                </div>
                            )
                        },
                        {
                            title: "Meta data",
                            node: (
                                <div className="flex flex-col gap-y-5 mt-5">
                                    <div className="flex gap-x-5">
                                        <Input className="flex-1 border" placeholder="Meta title" />
                                        <Input className="flex-1 border" placeholder="Meta Keywords" />
                                    </div>

                                    <TextArea rows={3} className="resize-none border" placeholder="Meta Description" />
                                </div>
                            )
                        }
                    ]} />
                </div>

                <div className="bg-white p-5 flex flex-col gap-y-5">
                    <h4 className="text-lg font-medium">Product gallery</h4>

                    <FileUpload multiple />
                </div>
                
                <div className="flex">
                    <button className="ml-auto px-4 py-2 bg-orange-400 text-white">Submit</button>
                </div>
            </div>
            <div>
                <div className="bg-white p-5">11</div>
            </div>
        </form>
    )
}