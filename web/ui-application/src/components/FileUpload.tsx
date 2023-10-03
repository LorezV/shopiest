"use client"

import { createRef, forwardRef, InputHTMLAttributes, Ref, useEffect, useState } from "react";
import { AiOutlineUpload, AiOutlineDelete } from "react-icons/ai";

interface FileUploadProps extends InputHTMLAttributes<HTMLInputElement> {
}

export default forwardRef(({ className, ...inputProps }: FileUploadProps, ref: Ref<HTMLInputElement>) => {
    const inputRef = createRef<HTMLInputElement>()
    const [files, setFiles] = useState<FileList | null>(null);

    ref = inputRef
    
    function humanFileSize(size: number) {
        var i = size == 0 ? 0 : Math.floor(Math.log(size) / Math.log(1024));
        return (size / Math.pow(1024, i)).toFixed(2) + ' ' + ['B', 'kB', 'MB', 'GB', 'TB'][i];
    }

    useEffect(() => {
        if (inputRef.current) {
            inputRef.current.files = files;
        }
    }, [files])

    function removeFile(index: number) {
        if (files) {
            const dt = new DataTransfer();

            for (let i = 0; i < files.length; i++) {
                if (i !== index) dt.items.add(files[i]);
            }

            setFiles(dt.files);
        }
    }

    return (
        <div className={["flex flex-col gap-y-2", className].join(" ")}>
            <label>
                <input type="file" className="hidden peer" ref={inputRef} onChange={(e) => setFiles(e.target.files)} {...inputProps} />

                <div className="py-5 cursor-pointer flex flex-col gap-y-3 items-center justify-center border-2 border-dashed">
                    <span className="text-[32px] text-gray-400"><AiOutlineUpload /></span>
                    <span className="text-gray-400">Drop files here</span>
                </div>
            </label>

            <div className="flex flex-col gap-y-2">
                {(() => {
                    let elements = []

                    if (files) {
                        for (let i = 0; i < files.length; i++) {
                            elements.push((
                                <div className="border px-4 py-2 flex items-center justify-center gap-x-4" key={i}>
                                    <div className="flex items-center justify-center w-10">
                                        <img className="h-full" src={URL.createObjectURL(files[i])} alt={files[i].name} />
                                    </div>

                                    <div className="flex-1">
                                        <span>{files[i].name}</span>
                                        <p className="text-gray-600 text-xs font-light">{humanFileSize(files[i].size)}</p>
                                    </div>

                                    <button type="button" className="p-2 bg-red-500 text-white" onClick={() => removeFile(i)}><AiOutlineDelete /></button>
                                </div>
                            ))
                        }
                    }

                    return elements;
                })()}
            </div>
        </div>
    )
})