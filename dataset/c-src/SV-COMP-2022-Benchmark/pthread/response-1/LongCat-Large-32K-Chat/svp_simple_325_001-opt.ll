; ModuleID = './dataset/c-src/SV-COMP-2022-Benchmark/pthread/response-1/LongCat-Large-32K-Chat/svp_simple_325_001.ll'
source_filename = "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_325_001.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.20.0"

@data1 = common local_unnamed_addr global i32 0, align 4, !dbg !0
@data2 = common local_unnamed_addr global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @reach_error() local_unnamed_addr #0 !dbg !16 {
entry:
  %call = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !19
  ret void, !dbg !20
}

declare i32 @assert(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_325_001_isr_1(i8* %arg) local_unnamed_addr #0 !dbg !21 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* @data1, align 4, !dbg !29
  %add = add nsw i32 %0, 1, !dbg !30
  store i32 %add, i32* %tmp, align 4, !dbg !28
  %1 = load i32, i32* %tmp, align 4, !dbg !31
  store i32 %1, i32* @data1, align 4, !dbg !32
  call void @llvm.dbg.declare(metadata i32* %tmp1, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = load i32, i32* @data2, align 4, !dbg !35
  %add1 = add nsw i32 %2, 1, !dbg !36
  store i32 %add1, i32* %tmp1, align 4, !dbg !34
  %3 = load i32, i32* %tmp1, align 4, !dbg !37
  store i32 %3, i32* @data2, align 4, !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @svp_simple_325_001_isr_2(i8* %arg) local_unnamed_addr #0 !dbg !40 {
entry:
  %arg.addr = alloca i8*, align 8
  %tmp = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  store i8* %arg, i8** %arg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %arg.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %tmp, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* @data1, align 4, !dbg !45
  %add = add nsw i32 %0, 5, !dbg !46
  store i32 %add, i32* %tmp, align 4, !dbg !44
  %1 = load i32, i32* %tmp, align 4, !dbg !47
  store i32 %1, i32* @data1, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %tmp1, metadata !49, metadata !DIExpression()), !dbg !50
  %2 = load i32, i32* @data2, align 4, !dbg !51
  %sub = sub nsw i32 %2, 6, !dbg !52
  store i32 %sub, i32* %tmp1, align 4, !dbg !50
  %3 = load i32, i32* %tmp1, align 4, !dbg !53
  store i32 %3, i32* @data2, align 4, !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @svp_simple_325_001_main() local_unnamed_addr #0 !dbg !56 {
entry:
  store i32 10, i32* @data1, align 4, !dbg !59
  store i32 10, i32* @data2, align 4, !dbg !60
  %0 = load i32, i32* @data1, align 4, !dbg !61
  %cmp = icmp ne i32 %0, 16, !dbg !63
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !64

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* @data2, align 4, !dbg !65
  %cmp1 = icmp ne i32 %1, 5, !dbg !66
  br i1 %cmp1, label %if.then, label %if.end, !dbg !67

if.then:                                          ; preds = %land.lhs.true
  br label %ERROR, !dbg !68

ERROR:                                            ; preds = %if.then
  call void @llvm.dbg.label(metadata !69), !dbg !71
  call void @reach_error(), !dbg !72
  call void @abort() #4, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %land.lhs.true, %entry
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #2

; Function Attrs: noreturn
declare void @abort() local_unnamed_addr #3

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }

!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.dbg.cu = !{!2}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "data1", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, nameTableKind: None)
!3 = !DIFile(filename: "/Users/hehang03/code/clover/dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_325_001.c", directory: "/Users/hehang03/code/clover")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "data2", scope: !2, file: !8, line: 6, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "dataset/c-src/SV-COMP-2022-Benchmark/pthread/svp_simple_325_001.c", directory: "/Users/hehang03/code/clover")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{!"clang version 10.0.0 "}
!16 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 4, type: !17, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocation(line: 4, column: 22, scope: !16)
!20 = !DILocation(line: 4, column: 33, scope: !16)
!21 = distinct !DISubprogram(name: "svp_simple_325_001_isr_1", scope: !8, file: !8, line: 8, type: !22, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !DILocalVariable(name: "arg", arg: 1, scope: !21, file: !8, line: 8, type: !24)
!26 = !DILocation(line: 8, column: 38, scope: !21)
!27 = !DILocalVariable(name: "tmp", scope: !21, file: !8, line: 10, type: !9)
!28 = !DILocation(line: 10, column: 7, scope: !21)
!29 = !DILocation(line: 10, column: 13, scope: !21)
!30 = !DILocation(line: 10, column: 18, scope: !21)
!31 = !DILocation(line: 11, column: 9, scope: !21)
!32 = !DILocation(line: 11, column: 8, scope: !21)
!33 = !DILocalVariable(name: "tmp1", scope: !21, file: !8, line: 12, type: !9)
!34 = !DILocation(line: 12, column: 7, scope: !21)
!35 = !DILocation(line: 12, column: 14, scope: !21)
!36 = !DILocation(line: 12, column: 19, scope: !21)
!37 = !DILocation(line: 13, column: 9, scope: !21)
!38 = !DILocation(line: 13, column: 8, scope: !21)
!39 = !DILocation(line: 15, column: 1, scope: !21)
!40 = distinct !DISubprogram(name: "svp_simple_325_001_isr_2", scope: !8, file: !8, line: 18, type: !22, scopeLine: 19, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DILocalVariable(name: "arg", arg: 1, scope: !40, file: !8, line: 18, type: !24)
!42 = !DILocation(line: 18, column: 38, scope: !40)
!43 = !DILocalVariable(name: "tmp", scope: !40, file: !8, line: 20, type: !9)
!44 = !DILocation(line: 20, column: 8, scope: !40)
!45 = !DILocation(line: 20, column: 14, scope: !40)
!46 = !DILocation(line: 20, column: 19, scope: !40)
!47 = !DILocation(line: 21, column: 9, scope: !40)
!48 = !DILocation(line: 21, column: 8, scope: !40)
!49 = !DILocalVariable(name: "tmp1", scope: !40, file: !8, line: 22, type: !9)
!50 = !DILocation(line: 22, column: 7, scope: !40)
!51 = !DILocation(line: 22, column: 14, scope: !40)
!52 = !DILocation(line: 22, column: 19, scope: !40)
!53 = !DILocation(line: 23, column: 9, scope: !40)
!54 = !DILocation(line: 23, column: 8, scope: !40)
!55 = !DILocation(line: 24, column: 1, scope: !40)
!56 = distinct !DISubprogram(name: "svp_simple_325_001_main", scope: !8, file: !8, line: 27, type: !57, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DISubroutineType(types: !58)
!58 = !{!9}
!59 = !DILocation(line: 30, column: 9, scope: !56)
!60 = !DILocation(line: 31, column: 9, scope: !56)
!61 = !DILocation(line: 35, column: 7, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !8, line: 35, column: 7)
!63 = !DILocation(line: 35, column: 12, scope: !62)
!64 = !DILocation(line: 35, column: 17, scope: !62)
!65 = !DILocation(line: 35, column: 20, scope: !62)
!66 = !DILocation(line: 35, column: 25, scope: !62)
!67 = !DILocation(line: 35, column: 7, scope: !56)
!68 = !DILocation(line: 36, column: 3, scope: !62)
!69 = !DILabel(scope: !70, name: "ERROR", file: !8, line: 37)
!70 = distinct !DILexicalBlock(scope: !62, file: !8, line: 36, column: 3)
!71 = !DILocation(line: 37, column: 5, scope: !70)
!72 = !DILocation(line: 37, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !8, line: 37, column: 12)
!74 = !DILocation(line: 37, column: 27, scope: !73)
!75 = !DILocation(line: 40, column: 3, scope: !56)
