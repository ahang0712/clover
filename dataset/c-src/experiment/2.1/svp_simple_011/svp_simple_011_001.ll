; ModuleID = 'svp_simple_011_001.bc'
source_filename = "./svp_simple_011_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_011_001_global_var1 = common global i32 0, align 4
@svp_simple_011_001_global_var2 = common global i32 0, align 4
@svp_simple_011_001_u = common global i32* null, align 8
@svp_simple_011_001_global_var3 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_011_001_main() #0 !dbg !7 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  call void (...) @init(), !dbg !10
  %3 = bitcast i32** %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #3, !dbg !11
  store i32* @svp_simple_011_001_global_var1, i32** %1, align 8, !dbg !12, !tbaa !13
  %4 = bitcast i32** %2 to i8*, !dbg !17
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #3, !dbg !17
  store i32* @svp_simple_011_001_global_var1, i32** %2, align 8, !dbg !18, !tbaa !13
  %5 = load i32*, i32** %1, align 8, !dbg !19, !tbaa !13
  store i32 1, i32* %5, align 4, !dbg !20, !tbaa !21
  %6 = load i32*, i32** %2, align 8, !dbg !23, !tbaa !13
  store i32 2, i32* %6, align 4, !dbg !24, !tbaa !21
  store i32* @svp_simple_011_001_global_var2, i32** @svp_simple_011_001_u, align 8, !dbg !25, !tbaa !13
  %7 = load i32*, i32** @svp_simple_011_001_u, align 8, !dbg !26, !tbaa !13
  store volatile i32 1, i32* %7, align 4, !dbg !27, !tbaa !21
  store i32* @svp_simple_011_001_global_var3, i32** @svp_simple_011_001_u, align 8, !dbg !28, !tbaa !13
  %8 = load i32*, i32** @svp_simple_011_001_u, align 8, !dbg !29, !tbaa !13
  store volatile i32 2, i32* %8, align 4, !dbg !30, !tbaa !21
  %9 = bitcast i32** %2 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #3, !dbg !31
  %10 = bitcast i32** %1 to i8*, !dbg !31
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #3, !dbg !31
  ret void, !dbg !31
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_011_001_isr_1() #0 !dbg !32 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = bitcast i32* %1 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #3, !dbg !33
  %5 = bitcast i32* %2 to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #3, !dbg !33
  %6 = bitcast i32** %3 to i8*, !dbg !34
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #3, !dbg !34
  store i32* @svp_simple_011_001_global_var1, i32** %3, align 8, !dbg !35, !tbaa !13
  %7 = load i32*, i32** %3, align 8, !dbg !36, !tbaa !13
  %8 = load i32, i32* %7, align 4, !dbg !37, !tbaa !21
  store i32 %8, i32* %1, align 4, !dbg !38, !tbaa !21
  %9 = load i32*, i32** @svp_simple_011_001_u, align 8, !dbg !39, !tbaa !13
  %10 = load volatile i32, i32* %9, align 4, !dbg !40, !tbaa !21
  store i32 %10, i32* %2, align 4, !dbg !41, !tbaa !21
  %11 = bitcast i32** %3 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #3, !dbg !42
  %12 = bitcast i32* %2 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #3, !dbg !42
  %13 = bitcast i32* %1 to i8*, !dbg !42
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %13) #3, !dbg !42
  ret void, !dbg !42
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_011_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_011")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_011_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_011_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_011")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 26, column: 3, scope: !7)
!11 = !DILocation(line: 27, column: 3, scope: !7)
!12 = !DILocation(line: 27, column: 8, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"any pointer", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 28, column: 3, scope: !7)
!18 = !DILocation(line: 28, column: 8, scope: !7)
!19 = !DILocation(line: 30, column: 4, scope: !7)
!20 = !DILocation(line: 30, column: 6, scope: !7)
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !15, i64 0}
!23 = !DILocation(line: 31, column: 4, scope: !7)
!24 = !DILocation(line: 31, column: 6, scope: !7)
!25 = !DILocation(line: 33, column: 24, scope: !7)
!26 = !DILocation(line: 34, column: 4, scope: !7)
!27 = !DILocation(line: 34, column: 25, scope: !7)
!28 = !DILocation(line: 35, column: 24, scope: !7)
!29 = !DILocation(line: 36, column: 4, scope: !7)
!30 = !DILocation(line: 36, column: 25, scope: !7)
!31 = !DILocation(line: 37, column: 1, scope: !7)
!32 = distinct !DISubprogram(name: "svp_simple_011_001_isr_1", scope: !8, file: !8, line: 39, type: !9, scopeLine: 39, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!33 = !DILocation(line: 40, column: 3, scope: !32)
!34 = !DILocation(line: 41, column: 3, scope: !32)
!35 = !DILocation(line: 41, column: 8, scope: !32)
!36 = !DILocation(line: 42, column: 14, scope: !32)
!37 = !DILocation(line: 42, column: 13, scope: !32)
!38 = !DILocation(line: 42, column: 11, scope: !32)
!39 = !DILocation(line: 43, column: 14, scope: !32)
!40 = !DILocation(line: 43, column: 13, scope: !32)
!41 = !DILocation(line: 43, column: 11, scope: !32)
!42 = !DILocation(line: 44, column: 1, scope: !32)
