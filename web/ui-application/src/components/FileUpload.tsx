"use client"

import { forwardRef, InputHTMLAttributes, Ref, useState } from "react";
import { AiOutlineUpload, AiOutlineDelete } from "react-icons/ai";

interface FileUploadProps extends InputHTMLAttributes<HTMLInputElement> {
}

export default forwardRef(({ className, ...inputProps }: FileUploadProps, ref: Ref<HTMLInputElement>) => {
    const [files, setFiles] = useState<FileList | null>(null);

    function getFiles() {
        let elements = []

        if (files) {
            for (let i = 0; i < files.length; i++) {
                elements.push((
                    <div className="border px-4 py-2 flex items-center" key={i}>
                        <div className="flex-1">
                            <span>{files[i].name}</span>
                            <p className="text-gray-600 text-xs font-light">{files[i].size}</p>
                        </div>

                        <button className="p-2 bg-red-500 text-white"><AiOutlineDelete /></button>
                    </div>
                ))
            }
        }

        return elements;
    }

    if (inputProps.multiple) {
        
    }

    return (
        <div className={["flex flex-col gap-y-2", className].join(" ")}>
            <label>
                <input type="file" className="hidden peer" onChange={(e) => setFiles(e.target.files)} {...inputProps} />

                <div className="py-5 cursor-pointer flex flex-col gap-y-3 items-center justify-center border-2 border-dashed">
                    <span className="text-[32px] text-gray-400"><AiOutlineUpload /></span>
                    <span className="text-gray-400">Drop files here</span>
                </div>
            </label>

            <div className="flex flex-col gap-y-2">
                {getFiles()}
            </div>
        </div>
    )
})