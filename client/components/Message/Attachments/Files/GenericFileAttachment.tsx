import React, { FC } from 'react';

import { Attachment, AttachmentPropsBase } from '../Attachment';
import RawText from '../../../RawText';
import { FileProp } from '..';
import { useMediaUrl } from '../context/AttachmentContext';
import { escapeHTML } from '../../../../../lib/escapeHTML';

export type GenericFileAttachmentProps = {
	file: FileProp;
} & AttachmentPropsBase;

export const GenericFileAttachment: FC<GenericFileAttachmentProps> = ({
	title,
	// collapsed: collapsedDefault = false,
	description,
	title_link: link,
	title_link_download: hasDownload,
	file,
}) => {
	// const [collapsed, collapse] = useCollapse(collapsedDefault);
	const getURL = useMediaUrl();
	return <Attachment>
		<Attachment.Content>
			{ description && <RawText>{escapeHTML(description)}</RawText> }
			<Attachment.Details>
				<Attachment.Row>
					{ hasDownload && link ? <Attachment.TitleLink link={getURL(link)} title={title} /> : <Attachment.Title>{title}</Attachment.Title> }
					{file && file.size && <Attachment.Size size={file.size}/>}
					{/* {collapse} */}
					{hasDownload && link && <Attachment.Download title={title} href={getURL(link)}/>}
				</Attachment.Row>
			</Attachment.Details>
		</Attachment.Content>
	</Attachment>;
};
