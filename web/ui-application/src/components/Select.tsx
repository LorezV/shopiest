import { Ref, forwardRef } from "react";
import { BiChevronDown } from "react-icons/bi"

interface SelectProps {
    placeholder?: React.ReactNode
    options: Array<{
        children: React.ReactNode
        value: any
    }>
}

export default forwardRef(({ options, placeholder }: SelectProps, ref: Ref<HTMLInputElement>) => {
    return (
        <div className="flex flex-col">
            <div className="px-4 py-2 flex gap-x-3">
                <span>{placeholder}</span>
                <BiChevronDown />
            </div>

            <div></div>
        </div>
    )
})