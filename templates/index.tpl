{include file="header.tpl" title="miNotes"}

<div id="container">
    
    <div id="notes-list">
	<div id="note" class="header">
	<span>Welcome to Blog App</a></span>
	
	</div>
        <div id="notes-list-header" class="header">
		
            <span class="left">Create Blog...</span>
            <span class="right"><a href="index.php?action=new"><img src="images/CreateNote.png" alt="Create new note."></a></span>
        </div>
        {foreach from=$notes item=note}
            <div class="notes-list-item">
                <span class="notes-list-item-title"><a href="index.php?action=navigate&id={$note.id}" {if $note.id eq $ACTIVE_NOTE_ID}class='active'{/if}>{$note.content|truncate:20}</a></span>
                <span class="notes-list-item-timestamp">{$note.last_modified|date_format:"%b %d"}</span>
            </div>      
        {/foreach}
    </div>

    <div id="notepad">
	<div id="note" class="header">
	<span class="Left"><a href="registration.php" target="_blank">New Registration</a></span>
	<span class="right"><a href="contact.php" target="_blank">Contact Admin</a></span>
	</div>
        <div id="notepad-header" class="header">
            <span><a href="#" onclick="document.getElementById('updateForm').submit();">Save</a></span>&nbsp;|&nbsp;<span><a href="index.php?action=delete">Delete</a></span>
            
        </div>
        <div>
            {foreach from=$notes item=note}
                {if $note.id eq $ACTIVE_NOTE_ID}
                <span id="timestamp">{$note.last_modified|date_format:"%B %d, %r"}</span>
                <form action="index.php" method="POST" id="updateForm">
                    <div id="tinymce-holder">
                        <textarea rows="20" cols="90" id="content" name="content" style="margin: 20px; border: 1px grey solid">{$note.content}</textarea>
                    </div>  
                    <input type="hidden" name="action" value="update"/>
                </form>
                {/if}
            {/foreach}
        </div>
    </div>
</div>

{include file="footer.tpl"}
